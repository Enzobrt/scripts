#!/usr/bin/env python3
import evdev
import subprocess
import threading
import selectors
import time

# Any device whose name contains one of these (case-insensitive) will be watched.
# Add brands/models here as you get new controllers.
# "x-box" already covers names like "Generic X-Box pad".
NAME_KEYWORDS = ["xbox", "powera", "x-box", "microsoft"]

# Optional: explicit by-id paths to always include, even if the name doesn't match.
EXPLICIT_PATHS = [
    "/dev/input/by-id/usb-PowerA_Xbox_Series_X_EnWired_Arc_Lightning_00000120CCBDA601-event-joystick",
]

HOLD_SECONDS = 3.0
BUTTON_CODE = evdev.ecodes.BTN_MODE  # 316, confirmed via evtest

COMMAND = ["/home/enzo/source/ES-DE/ES-DE_x64.AppImage"]


def run_command():
    subprocess.Popen(COMMAND)


def find_devices():
    found = {}
    for path in evdev.list_devices():
        try:
            dev = evdev.InputDevice(path)
        except OSError:
            continue
        name_lower = dev.name.lower()
        if any(k in name_lower for k in NAME_KEYWORDS):
            found[dev.path] = dev
        else:
            dev.close()

    for path in EXPLICIT_PATHS:
        if path not in found:
            try:
                dev = evdev.InputDevice(path)
                found[dev.path] = dev
            except OSError:
                pass  # not plugged in right now, skip silently

    return found


def main():
    devices = find_devices()
    if not devices:
        print("No matching controllers found. Check NAME_KEYWORDS or EXPLICIT_PATHS.")
        return

    print("Watching devices:")
    for dev in devices.values():
        print(f"  {dev.path}  ({dev.name})")

    selector = selectors.DefaultSelector()
    for dev in devices.values():
        selector.register(dev, selectors.EVENT_READ)

    timers = {}  # device path -> Timer

    try:
        while True:
            for key, _ in selector.select():
                dev = key.fileobj
                for event in dev.read():
                    if event.type == evdev.ecodes.EV_KEY and event.code == BUTTON_CODE:
                        if event.value == 1:  # pressed
                            t = threading.Timer(HOLD_SECONDS, run_command)
                            timers[dev.path] = t
                            t.start()
                        elif event.value == 0:  # released early
                            t = timers.pop(dev.path, None)
                            if t:
                                t.cancel()
    except KeyboardInterrupt:
        print("\nStopped.")


if __name__ == "__main__":
    main()
