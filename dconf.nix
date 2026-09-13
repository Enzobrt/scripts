# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "apps/seahorse/listing" = {
      keyrings-selected = [ "gnupg://" ];
    };

    "apps/seahorse/windows/key-manager" = {
      height = 476;
      width = 600;
    };

    "com/belmoussaoui/Decoder" = {
      is-maximized = false;
      window-height = 660;
      window-width = 420;
    };

    "com/github/FontManager/FontManager" = {
      browse-mode = "list";
      browse-pane-position = 54.947368;
      browse-preview-visible = true;
      content-size = 39.816233;
      hor-content-size = 35.987749;
      is-maximized = false;
      mode = "browse";
      prefer-dark-theme = true;
      preview-background-color = "rgb(0,0,0)";
      preview-foreground-color = "rgb(255,255,255)";
      sidebar-size = 32.947368;
      window-size = mkTuple [ 950 700 ];
    };

    "com/github/FontManager/FontViewer" = {
      prefer-dark-theme = true;
      preview-background-color = "rgb(0,0,0)";
      preview-foreground-color = "rgb(255,255,255)";
      window-size = mkTuple [ 675 500 ];
    };

    "io/gitlab/adhami3310/Converter" = {
      dpi = 300;
      is-maximized = false;
      output-format = "Gif";
      quality = 92;
      window-height = 750;
      window-width = 750;
    };

    "net/nokyan/Resources" = {
      is-maximized = true;
      window-height = 900;
      window-width = 1024;
    };

    "org/freedesktop/tracker/miner/files" = {
      index-recursive-directories = [ "$HOME" "&DOCUMENTS" "&DOWNLOAD" "&MUSIC" "&PICTURES" "&VIDEOS" ];
    };

    "org/gnome/Connections" = {
      first-run = false;
      window-size = mkTuple [ 1024 768 ];
    };

    "org/gnome/Console" = {
      last-window-maximised = true;
      last-window-size = mkTuple [ 732 528 ];
    };

    "org/gnome/Extensions" = {
      window-maximized = true;
    };

    "org/gnome/Mines" = {
      window-height = 400;
      window-is-maximized = false;
      window-width = 600;
    };

    "org/gnome/Music" = {
      window-maximized = true;
    };

    "org/gnome/Showtime/State" = {
      is-maximized = false;
    };

    "org/gnome/Snapshot" = {
      capture-mode = "qr-detection";
      is-maximized = false;
      last-camera-id = "Integrated Camera (V4L2)";
      window-height = 640;
      window-width = 800;
    };

    "org/gnome/TextEditor" = {
      highlight-current-line = true;
      last-save-directory = "file:///home/enzo/Downloads";
      right-margin-position = mkUint32 77;
      show-line-numbers = true;
      show-map = false;
      show-right-margin = false;
      style-scheme = "cobalt";
      tab-width = mkUint32 4;
      use-system-font = true;
    };

    "org/gnome/baobab/ui" = {
      active-chart = "rings";
      is-maximized = true;
      window-size = mkTuple [ 960 600 ];
    };

    "org/gnome/calculator" = {
      base = 10;
      button-mode = "basic";
      source-units = [ "degree" ];
      target-units = [ "radian" ];
      unit-category = "angle";
      window-maximized = false;
      window-size = mkTuple [ 360 616 ];
    };

    "org/gnome/calendar" = {
      active-view = "month";
      window-maximized = true;
      window-size = mkTuple [ 768 600 ];
    };

    "org/gnome/clocks/state/window" = {
      maximized = false;
      panel-id = "world";
      size = mkTuple [ 870 690 ];
    };

    "org/gnome/control-center" = {
      last-panel = "sound";
      window-state = mkTuple [ 1061 640 false ];
    };

    "org/gnome/desktop/a11y/applications" = {
      screen-reader-enabled = false;
    };

    "org/gnome/desktop/a11y/magnifier" = {
      cross-hairs-length = 58;
      mag-factor = 4.0;
    };

    "org/gnome/desktop/app-folders" = {
      folder-children = [ "YaST" "Pardus" "68d11a98-c872-4265-8639-bcb520fdb4d9" "25ee6d73-d41b-4ada-b5a4-ef776b8c042e" "a91e49cb-cc2b-4cdb-95e5-8c02e6d4dcfc" "946b3c76-88f4-480d-9f53-6ad94ca33940" "10934f49-0e58-47f3-8946-b095f6f55c10" "55f20195-5c50-4732-8fec-8e3d19e0669d" "a5efa915-bcc7-4772-9370-efce7e2841ae" "f64750be-6563-4c26-b5d0-bb6ae983d53f" "00612f99-8b7f-4bed-9ee0-a19d7636c610" "0cfb78d2-030e-4ef5-be85-77458ee715c3" ];
    };

    "org/gnome/desktop/app-folders/folders/00612f99-8b7f-4bed-9ee0-a19d7636c610" = {
      apps = [ "com.github.FontManager.FontManager.desktop" "com.github.FontManager.FontViewer.desktop" ];
      name = "Font";
      translate = false;
    };

    "org/gnome/desktop/app-folders/folders/0cfb78d2-030e-4ef5-be85-77458ee715c3" = {
      apps = [ "davinci-resolve.desktop" "davinci-fairlight-studio-utility.desktop" "blackmagicraw-speedtest.desktop" "blackmagicraw-player.desktop" "davinci-control-panels-setup.desktop" ];
      name = "Davinci resolve";
      translate = false;
    };

    "org/gnome/desktop/app-folders/folders/10934f49-0e58-47f3-8946-b095f6f55c10" = {
      apps = [ "org.gnome.TextEditor.desktop" "org.gnome.eog.desktop" "org.gnome.Yelp.desktop" "org.gnome.Nautilus.desktop" "org.gnome.Calendar.desktop" "org.gnome.tweaks.desktop" "org.gnome.Extensions.desktop" "org.gnome.Settings.desktop" "net.nokyan.Resources.desktop" "org.gnome.baobab.desktop" "org.gnome.DiskUtility.desktop" "org.gnome.SimpleScan.desktop" "org.gnome.Characters.desktop" "cups.desktop" "org.gnome.Calculator.desktop" "org.gnome.font-viewer.desktop" "org.gnome.Snapshot.desktop" "io.gitlab.adhami3310.Converter.desktop" "org.gnome.Logs.desktop" "org.gnome.clocks.desktop" ];
      name = "gnome bs";
      translate = false;
    };

    "org/gnome/desktop/app-folders/folders/25ee6d73-d41b-4ada-b5a4-ef776b8c042e" = {
      apps = [ "startcenter.desktop" "base.desktop" "calc.desktop" "draw.desktop" "impress.desktop" "math.desktop" "writer.desktop" ];
      name = "Office";
    };

    "org/gnome/desktop/app-folders/folders/55f20195-5c50-4732-8fec-8e3d19e0669d" = {
      apps = [ "com.mitchellh.ghostty.desktop" "org.gnome.Console.desktop" "lf.desktop" "btop.desktop" "xterm.desktop" "yazi.desktop" "rofi.desktop" "rofi-theme-selector.desktop" ];
      name = "Terminal bs";
      translate = false;
    };

    "org/gnome/desktop/app-folders/folders/68d11a98-c872-4265-8639-bcb520fdb4d9" = {
      apps = [ "Mindustry.desktop" "com.libretro.RetroArch.desktop" "steam.desktop" "curseforge.desktop" "Modrinth App.desktop" "es-de.desktop" "tinywii.desktop" "Ryujinx.desktop" "rpcs3.desktop" "R.E.P.O..desktop" "r2modman.desktop" "org.vinegarhq.Sober.desktop" "page.kramo.Cartridges.desktop" ];
      name = "Games";
    };

    "org/gnome/desktop/app-folders/folders/946b3c76-88f4-480d-9f53-6ad94ca33940" = {
      apps = [ "vim.desktop" "nvim.desktop" "obsidian.desktop" ];
      name = "Text editors";
      translate = false;
    };

    "org/gnome/desktop/app-folders/folders/Pardus" = {
      categories = [ "X-Pardus-Apps" ];
      name = "X-Pardus-Apps.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/YaST" = {
      categories = [ "X-SuSE-YaST" ];
      name = "suse-yast.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/a5efa915-bcc7-4772-9370-efce7e2841ae" = {
      apps = [ "brave-browser.desktop" "vesktop.desktop" "signal.desktop" "syncthing-ui.desktop" "syncthingtray.desktop" "org.kde.kdeconnect.app.desktop" "org.kde.kdeconnect.nonplasma.desktop" "org.kde.kdeconnect.sms.desktop" ];
      name = "Internet";
    };

    "org/gnome/desktop/app-folders/folders/a91e49cb-cc2b-4cdb-95e5-8c02e6d4dcfc" = {
      apps = [ "mpv.desktop" "audacity.desktop" "org.gnome.Music.desktop" "org.kde.kdenlive.desktop" "blender.desktop" "gimp.desktop" "org.pwmt.zathura.desktop" "audacity-4.desktop" ];
      name = "Sound & Video";
    };

    "org/gnome/desktop/app-folders/folders/f64750be-6563-4c26-b5d0-bb6ae983d53f" = {
      apps = [ "org.godotengine.Godot4.6.desktop" "unityhub.desktop" "arduino.desktop" "android-studio.desktop" ];
      name = "Programming";
    };

    "org/gnome/desktop/background" = {
      picture-options = "zoom";
      picture-uri = "file:///etc/nixos/home/assets/wallpaper.png";
      picture-uri-dark = "file:///etc/nixos/home/assets/wallpaper.png";
    };

    "org/gnome/desktop/break-reminders/eyesight" = {
      play-sound = true;
    };

    "org/gnome/desktop/break-reminders/movement" = {
      duration-seconds = mkUint32 300;
      interval-seconds = mkUint32 1800;
      play-sound = true;
    };

    "org/gnome/desktop/calendar" = {
      show-weekdate = false;
      week-start-day = "default";
    };

    "org/gnome/desktop/input-sources" = {
      sources = [ (mkTuple [ "xkb" "es" ]) ];
      xkb-options = [];
    };

    "org/gnome/desktop/interface" = {
      accent-color = "purple";
      clock-format = "24h";
      clock-show-seconds = false;
      clock-show-weekday = false;
      color-scheme = "prefer-dark";
      cursor-size = 22;
      cursor-theme = "Bibata-Modern-Classic";
      document-font-name = "JetBrains Mono 12";
      font-name = "JetBrains Mono 11";
      gtk-theme = "Tokyonight-Dark-BL";
      icon-theme = "candy-icons";
      monospace-font-name = "JetBrains Mono 11";
      show-battery-percentage = true;
      toolkit-accessibility = false;
    };

    "org/gnome/desktop/media-handling" = {
      autorun-never = true;
    };

    "org/gnome/desktop/notifications" = {
      application-children = [ "org-gnome-epiphany" "org-gnome-settings" "org-gnome-nautilus" "org-gnome-console" "gnome-about-panel" "brave-browser" "gnome-power-panel" "vesktop" "audacity" "org-keepassxc-keepassxc" "org-kde-kdeconnect-daemon" "org-kde-kdeconnect-app" "org-gnome-texteditor" "org-gnome-shell-extensions-gsconnect" "android-studio" "ryujinx" "modrinth-app" "vicinae" "davinci-resolve" "org-gnome-baobab" "gimp" "com-mitchellh-ghostty" "org-gnome-shell-extensions-gsconnect-preferences" ];
    };

    "org/gnome/desktop/notifications/application/android-studio" = {
      application-id = "android-studio.desktop";
    };

    "org/gnome/desktop/notifications/application/audacity" = {
      application-id = "audacity.desktop";
    };

    "org/gnome/desktop/notifications/application/brave-browser" = {
      application-id = "brave-browser.desktop";
    };

    "org/gnome/desktop/notifications/application/com-mitchellh-ghostty" = {
      application-id = "com.mitchellh.ghostty.desktop";
    };

    "org/gnome/desktop/notifications/application/davinci-resolve" = {
      application-id = "davinci-resolve.desktop";
    };

    "org/gnome/desktop/notifications/application/gimp" = {
      application-id = "gimp.desktop";
    };

    "org/gnome/desktop/notifications/application/gnome-about-panel" = {
      application-id = "gnome-about-panel.desktop";
    };

    "org/gnome/desktop/notifications/application/gnome-power-panel" = {
      application-id = "gnome-power-panel.desktop";
    };

    "org/gnome/desktop/notifications/application/modrinth-app" = {
      application-id = "Modrinth App.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-baobab" = {
      application-id = "org.gnome.baobab.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-console" = {
      application-id = "org.gnome.Console.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-epiphany" = {
      application-id = "org.gnome.Epiphany.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-nautilus" = {
      application-id = "org.gnome.Nautilus.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-settings" = {
      application-id = "org.gnome.Settings.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-shell-extensions-gsconnect-preferences" = {
      application-id = "org.gnome.Shell.Extensions.GSConnect.Preferences.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-shell-extensions-gsconnect" = {
      application-id = "org.gnome.Shell.Extensions.GSConnect.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-texteditor" = {
      application-id = "org.gnome.TextEditor.desktop";
    };

    "org/gnome/desktop/notifications/application/org-kde-kdeconnect-app" = {
      application-id = "org.kde.kdeconnect.app.desktop";
    };

    "org/gnome/desktop/notifications/application/org-kde-kdeconnect-daemon" = {
      application-id = "org.kde.kdeconnect.daemon.desktop";
    };

    "org/gnome/desktop/notifications/application/org-keepassxc-keepassxc" = {
      application-id = "org.keepassxc.KeePassXC.desktop";
    };

    "org/gnome/desktop/notifications/application/ryujinx" = {
      application-id = "Ryujinx.desktop";
    };

    "org/gnome/desktop/notifications/application/vesktop" = {
      application-id = "vesktop.desktop";
    };

    "org/gnome/desktop/notifications/application/vicinae" = {
      application-id = "vicinae.desktop";
    };

    "org/gnome/desktop/peripherals/keyboard" = {
      numlock-state = true;
    };

    "org/gnome/desktop/peripherals/mouse" = {
      natural-scroll = false;
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      click-method = "areas";
      disable-while-typing = false;
      natural-scroll = false;
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/screensaver" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = "file:///nix/store/hwb86w0jz4mlzb5frl480k299ny0mr5y-simple-blue-2016-02-19/share/backgrounds/nixos/nix-wallpaper-simple-blue.png";
      primary-color = "#3a4ba0";
      secondary-color = "#2f302f";
    };

    "org/gnome/desktop/search-providers" = {
      disabled = [];
      sort-order = [ "org.gnome.Epiphany.desktop" "org.gnome.Nautilus.desktop" "org.gnome.Settings.desktop" "org.gnome.Contacts.desktop" "org.gnome.Calculator.desktop" "page.kramo.Cartridges.desktop" "org.gnome.Calendar.desktop" "org.gnome.Characters.desktop" "org.gnome.clocks.desktop" "org.gnome.seahorse.Application.desktop" "org.gnome.Weather.desktop" ];
    };

    "org/gnome/desktop/session" = {
      idle-delay = mkUint32 900;
    };

    "org/gnome/desktop/sound" = {
      event-sounds = true;
      theme-name = "__custom";
    };

    "org/gnome/desktop/wm/keybindings" = {
      begin-move = [];
      begin-resize = [ "<Super>r" ];
      close = [ "<Super>q" ];
      maximize = [];
      switch-applications = [ "<Alt>Tab" ];
      switch-applications-backward = [ "<Shift><Alt>Tab" ];
      switch-input-source = [];
      switch-input-source-backward = [];
      switch-to-workspace-1 = [ "<Super>1" ];
      switch-to-workspace-2 = [ "<Super>2" ];
      switch-to-workspace-3 = [ "<Super>3" ];
      switch-to-workspace-4 = [ "<Super>4" ];
      switch-to-workspace-last = [];
      switch-windows = [ "<Super>Tab" ];
      switch-windows-backward = [ "<Shift><Super>Tab" ];
      toggle-fullscreen = [ "F11" ];
      toggle-maximized = [ "<Super>m" ];
      unmaximize = [ "<Shift><Super>r" ];
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:close";
      num-workspaces = 20;
    };

    "org/gnome/eog/ui" = {
      sidebar = false;
    };

    "org/gnome/epiphany" = {
      ask-for-default = false;
    };

    "org/gnome/epiphany/state" = {
      is-maximized = true;
      window-size = mkTuple [ 1920 1048 ];
    };

    "org/gnome/gnome-system-monitor" = {
      current-tab = "disks";
      maximized = true;
      show-dependencies = false;
      show-whose-processes = "user";
      window-height = 720;
      window-width = 800;
    };

    "org/gnome/gnome-system-monitor/proctree" = {
      col-26-visible = false;
      col-26-width = 0;
      columns-order = [ 0 12 1 2 3 4 6 7 8 9 10 11 13 14 15 16 17 18 19 20 21 22 23 24 25 26 ];
      sort-col = 0;
      sort-order = 1;
    };

    "org/gnome/maps" = {
      last-viewed-location = [ 40.317278 (-3.754971) ];
      map-type = "MapsVectorSource";
      transportation-type = "pedestrian";
      window-maximized = true;
      zoom-level = 16;
    };

    "org/gnome/mutter" = {
      dynamic-workspaces = true;
    };

    "org/gnome/nautilus/icon-view" = {
      default-zoom-level = "medium";
    };

    "org/gnome/nautilus/preferences" = {
      migrated-gtk-settings = true;
      show-create-link = true;
    };

    "org/gnome/nautilus/window-state" = {
      initial-size = mkTuple [ 890 550 ];
      initial-size-file-chooser = mkTuple [ 890 550 ];
      maximized = true;
    };

    "org/gnome/nm-applet/eap/5b56895b-1b7d-4eaa-b503-0ec9df27c1dd" = {
      ignore-ca-cert = false;
      ignore-phase2-ca-cert = false;
    };

    "org/gnome/nm-applet/eap/b367c5cb-d268-4cc9-9847-45397acb9075" = {
      ignore-ca-cert = false;
      ignore-phase2-ca-cert = false;
    };

    "org/gnome/orca/default/metadata" = {
      display-name = "Default";
      internal-name = "default";
    };

    "org/gnome/papers" = {
      night-mode = false;
    };

    "org/gnome/papers/default" = {
      annot-color = "yellow";
      continuous = true;
      dual-page = false;
      dual-page-odd-left = false;
      enable-spellchecking = true;
      eraser-mode-objects = "true";
      highlight-color = "yellow";
      highlight-stroke = 2.0;
      pen-color = "blue";
      pen-stroke = 1.0;
      show-sidebar = true;
      sizing-mode = "automatic";
      text-color = "blue";
      window-height = 1048;
    };

    "org/gnome/polari" = {
      window-maximized = true;
    };

    "org/gnome/portal/filechooser/Ryujinx" = {
      last-folder-path = "/home/enzo/Documents/Games/roms/switch";
    };

    "org/gnome/portal/filechooser/app/drey/Warp" = {
      last-folder-path = "/home/enzo/Pictures/Images";
    };

    "org/gnome/portal/filechooser/app/drey/Warp" = {
      last-folder-path = "/home/enzo/Pictures/Images";
    };

    "org/gnome/portal/filechooser/io/gitlab/adhami3310/Converter" = {
      last-folder-path = "/etc/nixos/home/assets";
    };

    "org/gnome/portal/filechooser/io/gitlab/adhami3310/Converter" = {
      last-folder-path = "/etc/nixos/home/assets";
    };

    "org/gnome/portal/filechooser/md/Obsidian" = {
      last-folder-path = "/home/enzo/Documents/notas-obsidian";
    };

    "org/gnome/portal/filechooser/md/Obsidian" = {
      last-folder-path = "/home/enzo/Documents/notas-obsidian";
    };

    "org/gnome/portal/filechooser/org/chromium/Chromium" = {
      last-folder-path = "/home/enzo/Downloads";
    };

    "org/gnome/portal/filechooser/org/gnome/TextEditor" = {
      last-folder-path = "/home/enzo/Downloads";
    };

    "org/gnome/portal/filechooser/org/gnome/World/PikaBackup" = {
      last-folder-path = "/home/enzo/source";
    };

    "org/gnome/portal/filechooser/org/chromium/Chromium" = {
      last-folder-path = "/home/enzo/Downloads";
    };

    "org/gnome/portal/filechooser/org/gnome/TextEditor" = {
      last-folder-path = "/home/enzo/Downloads";
    };

    "org/gnome/portal/filechooser/org/gnome/World/PikaBackup" = {
      last-folder-path = "/home/enzo/source";
    };

    "org/gnome/portal/filechooser/steam" = {
      last-folder-path = "/home/enzo/Documents/Games/Mindustry";
    };

    "org/gnome/portal/filechooser/surface-transient" = {
      last-folder-path = "/home/enzo/Documents/Games/roms/switch";
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-schedule-automatic = false;
    };

    "org/gnome/settings-daemon/plugins/housekeeping" = {
      donation-reminder-last-shown = mkInt64 1787139624345004;
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      control-center = [ "<Super>x" ];
      custom-keybindings = [ "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom6/" ];
      logout = [];
      www = [ "<Super>b" ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Super>t";
      command = "ghostty";
      name = "ghostty";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      binding = "<Super>f";
      command = "nautilus";
      name = "file browser";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
      binding = "<Super>i";
      command = "obsidian";
      name = "obsidian";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3" = {
      binding = "<Super>ntilde";
      command = "keepassxc";
      name = "keepassxc";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4" = {
      binding = "<Super>c";
      command = "vesktop";
      name = "vesktop";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5" = {
      binding = "<Super>d";
      command = "vicinae toggle";
      name = "vicinae";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom6" = {
      binding = "<Super>w";
      command = "/home/enzo/Documents/Programaci243n/scripts/wallpaper-switch.sh";
      name = "change wallpaper";
    };

    "org/gnome/settings-daemon/plugins/power" = {
      power-button-action = "interactive";
      sleep-inactive-ac-timeout = 3600;
      sleep-inactive-ac-type = "suspend";
      sleep-inactive-battery-timeout = 1800;
    };

    "org/gnome/settings-daemon/plugins/sharing/gnome-user-share-webdav" = {
      enabled-connections = [ "5b56895b-1b7d-4eaa-b503-0ec9df27c1dd" ];
    };

    "org/gnome/settings-daemon/plugins/sharing/rygel" = {
      enabled-connections = [ "5b56895b-1b7d-4eaa-b503-0ec9df27c1dd" ];
    };

    "org/gnome/shell" = {
      command-history = [ "autoclicker-toggle" "impala" "ghostty -e wiremix" "/home/enzo/Documents/Programaci243n/scripts/wofi-file-browser.sh" ];
      disable-user-extensions = false;
      disabled-extensions = [ "workspace-bar@jguece" "lan-ip-address@mrhuber.com" ];
      enabled-extensions = [ "appindicatorsupport@rgcjonas.gmail.com" "gsconnect@andyholmes.github.io" "caffeine@patapon.info" "media-keys@mafflin" "system-monitor-panel@naimur" "ResourceBuzzLite@hridoybuzz.dev" "emailmonitor@j-rambo.github.io" "syncthing@gnome.2nv2u.com" "top-bar-organizer@julian.gse.jsts.xyz" "openbar@neuromorph" "appindicatorsupport@rgcjonas.gmail.com" "gsconnect@andyholmes.github.io" "syncthing@gnome.2nv2u.com" "caffeine@patapon.info" "top-bar-organizer@julian.gse.jsts.xyz" "Resource_Monitor@Ory0n" "appindicatorsupport@rgcjonas.gmail.com" "lan-ip-address@mrhuber.com" "gsconnect@andyholmes.github.io" "syncthing@gnome.2nv2u.com" "caffeine@patapon.info" "Resource_Monitor@Ory0n" "top-bar-organizer@julian.gse.jsts.xyz" "appindicatorsupport@rgcjonas.gmail.com" "lan-ip-address@mrhuber.com" "gsconnect@andyholmes.github.io" "syncthing@gnome.2nv2u.com" "caffeine@patapon.info" "Resource_Monitor@Ory0n" "top-bar-organizer@julian.gse.jsts.xyz" "appindicatorsupport@rgcjonas.gmail.com" "lan-ip-address@mrhuber.com" "syncthing@gnome.2nv2u.com" "caffeine@patapon.info" "Resource_Monitor@Ory0n" "top-bar-organizer@julian.gse.jsts.xyz" "appindicatorsupport@rgcjonas.gmail.com" "lan-ip-address@mrhuber.com" "syncthing@gnome.2nv2u.com" "caffeine@patapon.info" "Resource_Monitor@Ory0n" "top-bar-organizer@julian.gse.jsts.xyz" "appindicatorsupport@rgcjonas.gmail.com" "lan-ip-address@mrhuber.com" "syncthing@gnome.2nv2u.com" "caffeine@patapon.info" "Resource_Monitor@Ory0n" "top-bar-organizer@julian.gse.jsts.xyz" "crossmacro@zynix.net" ];
      favorite-apps = [];
      last-selected-power-profile = "power-saver";
      welcome-dialog-last-shown-version = "50.4";
    };

    "org/gnome/shell/app-switcher" = {
      current-workspace-only = true;
    };

    "org/gnome/shell/extensions/caffeine" = {
      cli-toggle = false;
      indicator-position-max = 3;
    };

    "org/gnome/shell/extensions/flypie" = {
      menu-configuration = "[{\"name\":\"Example Menu\",\"icon\":\"flypie-symbolic-#46a\",\"shortcut\":\"<Primary>space\",\"centered\":false,\"id\":0,\"children\":[{\"name\":\"Sound\",\"icon\":\"flypie-multimedia-symbolic-#c86\",\"children\":[{\"name\":\"Mute\",\"icon\":\"flypie-multimedia-mute-symbolic-#853\",\"type\":\"Shortcut\",\"data\":\"AudioMute\",\"angle\":-1},{\"name\":\"Play / Pause\",\"icon\":\"flypie-multimedia-playpause-symbolic-#853\",\"type\":\"Shortcut\",\"data\":\"AudioPlay\",\"angle\":-1},{\"name\":\"Next Title\",\"icon\":\"flypie-multimedia-next-symbolic-#853\",\"type\":\"Shortcut\",\"data\":\"AudioNext\",\"angle\":90},{\"name\":\"Previous Title\",\"icon\":\"flypie-multimedia-previous-symbolic-#853\",\"type\":\"Shortcut\",\"data\":\"AudioPrev\",\"angle\":270}],\"type\":\"CustomMenu\",\"data\":{},\"angle\":-1},{\"name\":\"Favorites\",\"icon\":\"flypie-menu-favorites-symbolic-#da3\",\"type\":\"Favorites\",\"data\":{},\"angle\":-1},{\"name\":\"Next Workspace\",\"icon\":\"flypie-go-right-symbolic-#6b5\",\"type\":\"Shortcut\",\"data\":{\"shortcut\":\"<Control><Alt>Right\"},\"angle\":-1},{\"name\":\"Maximize Window\",\"icon\":\"flypie-window-maximize-symbolic-#b68\",\"type\":\"Shortcut\",\"data\":\"<Alt>F10\",\"angle\":-1},{\"name\":\"Fly-Pie Settings\",\"icon\":\"flypie-menu-system-symbolic-#3ab\",\"type\":\"Command\",\"data\":\"gnome-extensions prefs flypie@schneegans.github.com\",\"angle\":-1},{\"name\":\"Close Window\",\"icon\":\"flypie-window-close-symbolic-#a33\",\"type\":\"Shortcut\",\"data\":\"<Alt>F4\",\"angle\":-1},{\"name\":\"Previous Workspace\",\"icon\":\"flypie-go-left-symbolic-#6b5\",\"type\":\"Shortcut\",\"data\":{\"shortcut\":\"<Control><Alt>Left\"},\"angle\":-1},{\"name\":\"Running Apps\",\"icon\":\"flypie-menu-running-apps-symbolic-#65a\",\"type\":\"RunningApps\",\"data\":{\"activeWorkspaceOnly\":false,\"appGrouping\":true,\"hoverPeeking\":true,\"nameRegex\":\"\"},\"angle\":-1}],\"type\":\"CustomMenu\",\"data\":{}}]";
    };

    "org/gnome/shell/extensions/gsconnect" = {
      devices = [ "7a5b479c4c3f4082acc761ca3546fd53" "c0b0c51d30f941608c3aa195c5e43211" ];
      discoverable = true;
      missing-openssl = false;
      name = "nixos";
    };

    "org/gnome/shell/extensions/gsconnect/device/6212c78c4de34ae7b1258632c46093f9" = {
      incoming-capabilities = [ "kdeconnect.battery" "kdeconnect.clipboard" "kdeconnect.clipboard.connect" "kdeconnect.contacts.request_all_uids_timestamps" "kdeconnect.contacts.request_vcards_by_uid" "kdeconnect.findmyphone.request" "kdeconnect.mousepad.keyboardstate" "kdeconnect.mousepad.request" "kdeconnect.mpris" "kdeconnect.mpris.request" "kdeconnect.notification" "kdeconnect.notification.action" "kdeconnect.notification.reply" "kdeconnect.notification.request" "kdeconnect.ping" "kdeconnect.runcommand" "kdeconnect.runcommand.output" "kdeconnect.sftp.request" "kdeconnect.share.request" "kdeconnect.share.request.update" "kdeconnect.shareinputdevices.request" "kdeconnect.sms.request" "kdeconnect.sms.request_attachment" "kdeconnect.sms.request_conversation" "kdeconnect.sms.request_conversations" "kdeconnect.systemvolume" "kdeconnect.telephony.request_mute" ];
      last-connection = "lan://192.168.0.20:1716";
      name = "realme GT Master Edition";
      outgoing-capabilities = [ "kdeconnect.battery" "kdeconnect.clipboard" "kdeconnect.clipboard.connect" "kdeconnect.connectivity_report" "kdeconnect.contacts.response_uids_timestamps" "kdeconnect.contacts.response_vcards" "kdeconnect.digitizer" "kdeconnect.digitizer.session" "kdeconnect.findmyphone.request" "kdeconnect.mousepad.echo" "kdeconnect.mousepad.keyboardstate" "kdeconnect.mousepad.request" "kdeconnect.mpris" "kdeconnect.mpris.request" "kdeconnect.notification" "kdeconnect.notification.request" "kdeconnect.ping" "kdeconnect.presenter" "kdeconnect.runcommand.request" "kdeconnect.sftp" "kdeconnect.share.request" "kdeconnect.shareinputdevices" "kdeconnect.sms.attachment_file" "kdeconnect.sms.messages" "kdeconnect.systemvolume.request" "kdeconnect.telephony" ];
      supported-plugins = [ "battery" "clipboard" "connectivity_report" "contacts" "findmyphone" "mousepad" "mpris" "notification" "ping" "presenter" "runcommand" "sftp" "share" "sms" "systemvolume" "telephony" ];
      type = "phone";
    };

    "org/gnome/shell/extensions/gsconnect/device/7a5b479c4c3f4082acc761ca3546fd53" = {
      incoming-capabilities = [ "kdeconnect.battery" "kdeconnect.clipboard" "kdeconnect.clipboard.connect" "kdeconnect.clipboard.file" "kdeconnect.connectivity_report" "kdeconnect.contacts.response_uids_timestamps" "kdeconnect.contacts.response_vcards" "kdeconnect.digitizer" "kdeconnect.digitizer.session" "kdeconnect.findmyphone.request" "kdeconnect.lock" "kdeconnect.lock.request" "kdeconnect.mousepad.echo" "kdeconnect.mousepad.keyboardstate" "kdeconnect.mousepad.request" "kdeconnect.mpris" "kdeconnect.mpris.request" "kdeconnect.notification" "kdeconnect.notification.request" "kdeconnect.ping" "kdeconnect.presenter" "kdeconnect.runcommand" "kdeconnect.runcommand.request" "kdeconnect.sftp" "kdeconnect.share.request" "kdeconnect.shareinputdevices" "kdeconnect.shareinputdevices.request" "kdeconnect.sms.attachment_file" "kdeconnect.sms.messages" "kdeconnect.systemvolume" "kdeconnect.systemvolume.request" "kdeconnect.telephony" "kdeconnect.telephony.request_mute" "kdeconnect.virtualmonitor" "kdeconnect.virtualmonitor.request" ];
      last-connection = "lan://192.168.0.29:1716";
      name = "arch-yago";
      outgoing-capabilities = [ "kdeconnect.battery" "kdeconnect.clipboard" "kdeconnect.clipboard.connect" "kdeconnect.clipboard.file" "kdeconnect.contacts.request_all_uids_timestamps" "kdeconnect.contacts.request_vcards_by_uid" "kdeconnect.findmyphone.request" "kdeconnect.lock" "kdeconnect.lock.request" "kdeconnect.mousepad.keyboardstate" "kdeconnect.mousepad.request" "kdeconnect.mpris" "kdeconnect.mpris.request" "kdeconnect.notification" "kdeconnect.notification.action" "kdeconnect.notification.reply" "kdeconnect.notification.request" "kdeconnect.ping" "kdeconnect.runcommand" "kdeconnect.runcommand.request" "kdeconnect.sftp.request" "kdeconnect.share.request" "kdeconnect.share.request.update" "kdeconnect.shareinputdevices" "kdeconnect.shareinputdevices.request" "kdeconnect.sms.request" "kdeconnect.sms.request_attachment" "kdeconnect.sms.request_conversation" "kdeconnect.sms.request_conversations" "kdeconnect.systemvolume" "kdeconnect.systemvolume.request" "kdeconnect.telephony" "kdeconnect.telephony.request_mute" "kdeconnect.virtualmonitor" "kdeconnect.virtualmonitor.request" ];
      supported-plugins = [ "battery" "clipboard" "findmyphone" "mousepad" "mpris" "notification" "ping" "runcommand" "share" "systemvolume" "telephony" ];
      type = "desktop";
    };

    "org/gnome/shell/extensions/gsconnect/device/7a5b479c4c3f4082acc761ca3546fd53/plugin/battery" = {
      custom-battery-notification-value = mkUint32 80;
    };

    "org/gnome/shell/extensions/gsconnect/device/7a5b479c4c3f4082acc761ca3546fd53/plugin/notification" = {
      applications = ''
        {"Printers":{"iconName":"org.gnome.Settings-printers-symbolic","enabled":true},"Events and Tasks Reminders":{"iconName":"org.gnome.Evolution-alarm-notify","enabled":true},"Pika Backup":{"iconName":"org.gnome.World.PikaBackup","enabled":true},"Zenity":{"iconName":"application-x-executable","enabled":true},"Disks":{"iconName":"org.gnome.DiskUtility","enabled":true},"Date & Time":{"iconName":"org.gnome.Settings-time-symbolic","enabled":true},"Online Accounts":{"iconName":"org.gnome.goa-daemon-symbolic","enabled":true},"Ghostty":{"iconName":"com.mitchellh.ghostty","enabled":true},"Disk Usage Analyzer":{"iconName":"org.gnome.baobab","enabled":true},"Power":{"iconName":"org.gnome.Settings-power-symbolic","enabled":true},"Console":{"iconName":"org.gnome.Console","enabled":true},"Color Management":{"iconName":"org.gnome.Settings-color-symbolic","enabled":true},"Files":{"iconName":"org.gnome.Nautilus","enabled":true},"Clocks":{"iconName":"org.gnome.clocks","enabled":true},"Pika Backup Monitor":{"iconName":"org.gnome.World.PikaBackup","enabled":true}}\\\\\\\\\\\\\\\\n\\\\\\\\n\\\\n\\n\n
      '';
    };

    "org/gnome/shell/extensions/gsconnect/device/7a5b479c4c3f4082acc761ca3546fd53/plugin/share" = {
      receive-directory = "/home/enzo/Downloads";
    };

    "org/gnome/shell/extensions/gsconnect/device/c0b0c51d30f941608c3aa195c5e43211" = {
      incoming-capabilities = [ "kdeconnect.battery" "kdeconnect.clipboard" "kdeconnect.clipboard.connect" "kdeconnect.clipboard.file" "kdeconnect.connectivity_report" "kdeconnect.contacts.response_uids_timestamps" "kdeconnect.contacts.response_vcards" "kdeconnect.digitizer" "kdeconnect.digitizer.session" "kdeconnect.findmyphone.request" "kdeconnect.lock" "kdeconnect.lock.request" "kdeconnect.mousepad.echo" "kdeconnect.mousepad.keyboardstate" "kdeconnect.mousepad.request" "kdeconnect.mpris" "kdeconnect.mpris.request" "kdeconnect.notification" "kdeconnect.notification.request" "kdeconnect.ping" "kdeconnect.presenter" "kdeconnect.runcommand" "kdeconnect.runcommand.request" "kdeconnect.sftp" "kdeconnect.share.request" "kdeconnect.shareinputdevices" "kdeconnect.shareinputdevices.request" "kdeconnect.sms.attachment_file" "kdeconnect.sms.messages" "kdeconnect.systemvolume" "kdeconnect.systemvolume.request" "kdeconnect.telephony" "kdeconnect.telephony.request_mute" "kdeconnect.virtualmonitor" "kdeconnect.virtualmonitor.request" ];
      last-connection = "lan://192.168.0.16:1717";
      name = "nixos";
      outgoing-capabilities = [ "kdeconnect.battery" "kdeconnect.clipboard" "kdeconnect.clipboard.connect" "kdeconnect.clipboard.file" "kdeconnect.contacts.request_all_uids_timestamps" "kdeconnect.contacts.request_vcards_by_uid" "kdeconnect.findmyphone.request" "kdeconnect.lock" "kdeconnect.lock.request" "kdeconnect.mousepad.keyboardstate" "kdeconnect.mousepad.request" "kdeconnect.mpris" "kdeconnect.mpris.request" "kdeconnect.notification" "kdeconnect.notification.action" "kdeconnect.notification.reply" "kdeconnect.notification.request" "kdeconnect.ping" "kdeconnect.runcommand" "kdeconnect.runcommand.request" "kdeconnect.sftp.request" "kdeconnect.share.request" "kdeconnect.share.request.update" "kdeconnect.shareinputdevices" "kdeconnect.shareinputdevices.request" "kdeconnect.sms.request" "kdeconnect.sms.request_attachment" "kdeconnect.sms.request_conversation" "kdeconnect.sms.request_conversations" "kdeconnect.systemvolume" "kdeconnect.systemvolume.request" "kdeconnect.telephony" "kdeconnect.telephony.request_mute" "kdeconnect.virtualmonitor" "kdeconnect.virtualmonitor.request" ];
      supported-plugins = [ "battery" "clipboard" "findmyphone" "mousepad" "mpris" "notification" "ping" "runcommand" "share" "systemvolume" "telephony" ];
      type = "desktop";
    };

    "org/gnome/shell/extensions/gsconnect/preferences" = {
      window-maximized = false;
      window-size = mkTuple [ 878 550 ];
    };

    "org/gnome/shell/extensions/openbar" = {
      accent-color = [ "0.753" "0.380" "0.796" ];
      accent-override = true;
      apply-accent-shell = false;
      apply-all-shell = false;
      apply-flatpak = false;
      apply-gtk = false;
      apply-menu-notif = true;
      apply-menu-shell = false;
      auto-bgalpha = true;
      autofg-bar = true;
      autofg-menu = true;
      autohg-bar = true;
      autohg-menu = true;
      autotheme-dark = "Color";
      autotheme-font = true;
      autotheme-light = "Select Theme";
      autotheme-refresh = true;
      balpha = 0.39;
      bartype = "Trilands";
      bcolor = [ "0.871" "0.616" "0.498" ];
      bg-change = false;
      bgalpha = 0.0;
      bgalpha-wmax = 1.0;
      bgalpha2 = 0.9;
      bgcolor = [ "0.282" "0.306" "0.298" ];
      bgcolor-wmax = [ "0.129" "0.122" "0.129" ];
      bgcolor2 = [ "0.420" "0.608" "0.420" ];
      bgpalette = false;
      bguri = "file:///etc/nixos/home/assets/wallpaper.png";
      border-wmax = false;
      bordertype = "solid";
      bottom-margin = 2.5;
      boxalpha = 0.0;
      boxcolor = [ "0.282" "0.306" "0.298" ];
      bradius = 13.0;
      buttonbg-wmax = true;
      bwidth = 0.0;
      candy1 = [ "0" "0.61" "0.74" ];
      candy10 = [ "0.09" "0.19" "0.72" ];
      candy11 = [ "0.75" "0.49" "0.44" ];
      candy12 = [ "1" "0.92" "0.12" ];
      candy13 = [ "0.38" "0.63" "0.92" ];
      candy14 = [ "0.37" "0.36" "0.39" ];
      candy15 = [ "0.4000000059604645" "0.23000000417232513" "0.7200000286102295" ];
      candy16 = [ "1" "0.3199999928474426" "0.3199999928474426" ];
      candy2 = [ "1" "0.41" "0.41" ];
      candy3 = [ "0.63" "0.16" "0.8" ];
      candy4 = [ "0.94" "0.60" "0.23" ];
      candy5 = [ "0.029999999329447746" "0.4099999964237213" "0.6200000047683716" ];
      candy6 = [ "0.56" "0.18" "0.43" ];
      candy7 = [ "0.95" "0.12" "0.67" ];
      candy8 = [ "0.18000000715255737" "0.7599999904632568" "0.49000000953674316" ];
      candy9 = [ "0.93" "0.20" "0.23" ];
      candyalpha = 1.0;
      candybar = false;
      card-hint = 10;
      color-scheme = "prefer-dark";
      corner-radius = true;
      count1 = 428930;
      count10 = 59;
      count11 = 19;
      count12 = 13;
      count2 = 61087;
      count3 = 31107;
      count4 = 23587;
      count5 = 15098;
      count6 = 1014;
      count7 = 400;
      count8 = 368;
      count9 = 318;
      cust-margin-wmax = false;
      dark-accent-color = [ "0.753" "0.380" "0.796" ];
      dark-bcolor = [ "0.871" "0.616" "0.498" ];
      dark-bgcolor = [ "0.282" "0.306" "0.298" ];
      dark-bgcolor-wmax = [ "0.129" "0.122" "0.129" ];
      dark-bgcolor2 = [ "0.420" "0.608" "0.420" ];
      dark-bguri = "file:///etc/nixos/home/assets/wallpaper.png";
      dark-boxcolor = [ "0.282" "0.306" "0.298" ];
      dark-candy1 = [ "0" "0.61" "0.74" ];
      dark-candy10 = [ "0.09" "0.19" "0.72" ];
      dark-candy11 = [ "0.75" "0.49" "0.44" ];
      dark-candy12 = [ "1" "0.92" "0.12" ];
      dark-candy13 = [ "0.38" "0.63" "0.92" ];
      dark-candy14 = [ "0.37" "0.36" "0.39" ];
      dark-candy15 = [ "0.4000000059604645" "0.23000000417232513" "0.7200000286102295" ];
      dark-candy16 = [ "1" "0.3199999928474426" "0.3199999928474426" ];
      dark-candy2 = [ "1" "0.41" "0.41" ];
      dark-candy3 = [ "0.63" "0.16" "0.8" ];
      dark-candy4 = [ "0.94" "0.60" "0.23" ];
      dark-candy5 = [ "0.029999999329447746" "0.4099999964237213" "0.6200000047683716" ];
      dark-candy6 = [ "0.56" "0.18" "0.43" ];
      dark-candy7 = [ "0.95" "0.12" "0.67" ];
      dark-candy8 = [ "0.18000000715255737" "0.7599999904632568" "0.49000000953674316" ];
      dark-candy9 = [ "0.93" "0.20" "0.23" ];
      dark-dbgcolor = [ "0.000" "0.000" "0.000" ];
      dark-fgcolor = [ "1.000" "1.000" "1.000" ];
      dark-hcolor = [ "0.482" "0.733" "0.698" ];
      dark-hscd-color = [ "0.753" "0.376" "0.792" ];
      dark-iscolor = [ "0.282" "0.306" "0.298" ];
      dark-mbcolor = [ "0.482" "0.733" "0.698" ];
      dark-mbgcolor = [ "0.173" "0.235" "0.235" ];
      dark-mfgcolor = [ "1" "1" "1" ];
      dark-mhcolor = [ "0.482" "0.733" "0.698" ];
      dark-mscolor = [ "0.753" "0.376" "0.792" ];
      dark-mshcolor = [ "0.000" "0.000" "0.000" ];
      dark-palette1 = [ "44" "60" "60" ];
      dark-palette10 = [ "60" "84" "73" ];
      dark-palette11 = [ "91" "124" "124" ];
      dark-palette12 = [ "144" "130" "92" ];
      dark-palette2 = [ "223" "157" "127" ];
      dark-palette3 = [ "123" "187" "178" ];
      dark-palette4 = [ "107" "155" "107" ];
      dark-palette5 = [ "76" "91" "92" ];
      dark-palette6 = [ "72" "78" "76" ];
      dark-palette7 = [ "171" "97" "98" ];
      dark-palette8 = [ "112" "82" "79" ];
      dark-palette9 = [ "79" "111" "92" ];
      dark-shcolor = [ "0.000" "0.000" "0.000" ];
      dark-smbgcolor = [ "0.420" "0.608" "0.420" ];
      dark-vw-color = [ "0.753" "0.376" "0.792" ];
      dark-winbcolor = [ "0.753" "0.376" "0.792" ];
      dashdock-style = "Default";
      dbgalpha = 0.41;
      dbgcolor = [ "0.000" "0.000" "0.000" ];
      dborder = true;
      dbradius = 20.0;
      default-font = "Sans 12";
      destruct-color = [ "0.75" "0.11" "0.16" ];
      disize = 42.0;
      dshadow = false;
      fgalpha = 1.0;
      fgcolor = [ "1.000" "1.000" "1.000" ];
      fitts-widgets = true;
      font = "JetBrains Mono 12";
      gradient = true;
      gradient-direction = "vertical";
      gtk-popover = true;
      gtk-shadow = "Default";
      gtk-transparency = 1.0;
      halpha = 0.4;
      handle-border = 3.0;
      hbar-gtk3only = false;
      hcolor = [ "0.482" "0.733" "0.698" ];
      headerbar-hint = 2;
      heffect = true;
      height = 40.0;
      hpad = 0.5;
      hscd-color = [ "0.753" "0.376" "0.792" ];
      import-export = false;
      isalpha = 0.95;
      iscolor = [ "0.282" "0.306" "0.298" ];
      light-accent-color = [ "0" "0.75" "0.75" ];
      light-bcolor = [ "0.824" "0.459" "0.447" ];
      light-bgcolor = [ "0.169" "0.349" "0.435" ];
      light-bgcolor-wmax = [ "0.918" "0.910" "0.918" ];
      light-bgcolor2 = [ "0.929" "0.675" "0.424" ];
      light-bguri = "file:///etc/nixos/home/assets/wallpaper.png";
      light-boxcolor = [ "0.169" "0.349" "0.435" ];
      light-candy1 = [ "0" "0.61" "0.74" ];
      light-candy10 = [ "0.09" "0.19" "0.72" ];
      light-candy11 = [ "0.75" "0.49" "0.44" ];
      light-candy12 = [ "1" "0.92" "0.12" ];
      light-candy13 = [ "0.38" "0.63" "0.92" ];
      light-candy14 = [ "0.37" "0.36" "0.39" ];
      light-candy15 = [ "0.40" "0.23" "0.72" ];
      light-candy16 = [ "1" "0.32" "0.32" ];
      light-candy2 = [ "1" "0.41" "0.41" ];
      light-candy3 = [ "0.63" "0.16" "0.8" ];
      light-candy4 = [ "0.94" "0.60" "0.23" ];
      light-candy5 = [ "0.03" "0.41" "0.62" ];
      light-candy6 = [ "0.56" "0.18" "0.43" ];
      light-candy7 = [ "0.95" "0.12" "0.67" ];
      light-candy8 = [ "0.18" "0.76" "0.49" ];
      light-candy9 = [ "0.93" "0.20" "0.23" ];
      light-dbgcolor = [ "0.125" "0.125" "0.125" ];
      light-fgcolor = [ "1.0" "1.0" "1.0" ];
      light-hcolor = [ "0.149" "0.106" "0.106" ];
      light-hscd-color = [ "0.753" "0.376" "0.792" ];
      light-iscolor = [ "0.169" "0.349" "0.435" ];
      light-mbcolor = [ "0.149" "0.106" "0.106" ];
      light-mbgcolor = [ "0.420" "0.643" "0.765" ];
      light-mfgcolor = [ "1.0" "1.0" "1.0" ];
      light-mhcolor = [ "0.149" "0.106" "0.106" ];
      light-mscolor = [ "0.753" "0.376" "0.792" ];
      light-mshcolor = [ "0.000" "0.000" "0.000" ];
      light-palette1 = [ "44" "60" "60" ];
      light-palette10 = [ "60" "84" "73" ];
      light-palette11 = [ "91" "124" "124" ];
      light-palette12 = [ "144" "130" "92" ];
      light-palette2 = [ "223" "157" "127" ];
      light-palette3 = [ "123" "187" "178" ];
      light-palette4 = [ "107" "155" "107" ];
      light-palette5 = [ "76" "91" "92" ];
      light-palette6 = [ "72" "78" "76" ];
      light-palette7 = [ "171" "97" "98" ];
      light-palette8 = [ "112" "82" "79" ];
      light-palette9 = [ "79" "111" "92" ];
      light-shcolor = [ "0.000" "0.000" "0.000" ];
      light-smbgcolor = [ "0.929" "0.675" "0.424" ];
      light-vw-color = [ "0.753" "0.376" "0.792" ];
      light-winbcolor = [ "0.753" "0.376" "0.792" ];
      margin = 2.5;
      margin-wmax = 0.0;
      mbalpha = 1.0;
      mbcolor = [ "0.482" "0.733" "0.698" ];
      mbg-gradient = false;
      mbgalpha = 0.9;
      mbgcolor = [ "0.173" "0.235" "0.235" ];
      menu-radius = 21.0;
      menustyle = true;
      mfgalpha = 1.0;
      mfgcolor = [ "1" "1" "1" ];
      mhalpha = 0.53;
      mhcolor = [ "0.482" "0.733" "0.698" ];
      monitor-height = 1080;
      monitor-width = 1920;
      monitors = "all";
      msalpha = 0.85;
      mscolor = [ "0.753" "0.376" "0.792" ];
      mshalpha = 0.16;
      mshcolor = [ "0.000" "0.000" "0.000" ];
      neon = true;
      neon-wmax = true;
      notif-radius = 10.0;
      palette1 = [ "44" "60" "60" ];
      palette10 = [ "60" "84" "73" ];
      palette11 = [ "91" "124" "124" ];
      palette12 = [ "144" "130" "92" ];
      palette2 = [ "223" "157" "127" ];
      palette3 = [ "123" "187" "178" ];
      palette4 = [ "107" "155" "107" ];
      palette5 = [ "76" "91" "92" ];
      palette6 = [ "72" "78" "76" ];
      palette7 = [ "171" "97" "98" ];
      palette8 = [ "112" "82" "79" ];
      palette9 = [ "79" "111" "92" ];
      pause-reload = false;
      position = "Top";
      prominent1 = [ "100" "100" "100" ];
      prominent2 = [ "100" "100" "100" ];
      prominent3 = [ "100" "100" "100" ];
      prominent4 = [ "100" "100" "100" ];
      prominent5 = [ "100" "100" "100" ];
      prominent6 = [ "100" "100" "100" ];
      qtoggle-radius = 50.0;
      radius-bottomleft = true;
      radius-bottomright = true;
      radius-topleft = true;
      radius-topright = true;
      reloadstyle = false;
      removestyle = false;
      sbar-gradient = "none";
      set-bottom-margin = false;
      set-fullscreen = false;
      set-notif-position = false;
      set-notifications = false;
      set-overview = true;
      set-yarutheme = false;
      shadow = false;
      shalpha = 0.3;
      shcolor = [ "0.000" "0.000" "0.000" ];
      sidebar-hint = 10;
      sidebar-transparency = false;
      slider-height = 4.0;
      smbgalpha = 0.95;
      smbgcolor = [ "0.420" "0.608" "0.420" ];
      smbgoverride = true;
      success-color = [ "0.15" "0.635" "0.41" ];
      traffic-light = true;
      trigger-autotheme = true;
      trigger-reload = true;
      use-system-accent = false;
      view-hint = 2;
      vpad = 2.9;
      vw-color = [ "0.753" "0.376" "0.792" ];
      warning-color = [ "0.96" "0.83" "0.17" ];
      width-bottom = true;
      width-left = true;
      width-right = true;
      width-top = true;
      winbalpha = 1.0;
      winbcolor = [ "0.753" "0.376" "0.792" ];
      winbradius = 15.0;
      winbwidth = 0.2;
      window-hint = 2;
      wmax-hbarhint = false;
      wmaxbar = true;
    };

    "org/gnome/shell/extensions/resource-monitor" = {
      cpucolors = [ "0 0.14901961386203766 0.6352941393852234 0.4117647111415863" "20 0.34117648005485535 0.8901960849761963 0.5372549295425415" "65 0.9647058844566345 0.8274509906768799 0.1764705926179886" "80 1 0.47058823704719543 0" "92 0.8784313797950745 0.10588235408067703 0.1411764770746231" ];
      cpufrequencycolors = [];
      cpufrequencystatus = false;
      cpuloadaveragecolors = [];
      cpuloadaveragestatus = false;
      cpurendermode = "precise";
      cpustatus = true;
      customleftclickstatus = "resources";
      diskdevicesdisplayall = true;
      diskdeviceslist = [ ''
        {"version":2,"type":"disk","device":"/dev/nvme0n1p2","stableId":"/dev/disk/by-uuid/bd0f3464-e7ce-4c0a-8564-de87eacd1702","mountPoint":"/","stats":false,"space":false,"displayName":"/dev/nvme0n1p2"}\\\\\\\\n\\\\n\\n\n
      '' ''
        {"version":2,"type":"disk","device":"/dev/nvme0n1p2","stableId":"/dev/disk/by-uuid/bd0f3464-e7ce-4c0a-8564-de87eacd1702","mountPoint":"/nix/store","stats":false,"space":false,"displayName":"/dev/nvme0n1p2"}\\\\\\\\n\\\\n\\n\n
      '' ''
        {"version":2,"type":"disk","device":"/dev/nvme0n1p1","stableId":"/dev/disk/by-uuid/4342-37A9","mountPoint":"/boot","stats":false,"space":false,"displayName":"/dev/nvme0n1p1"}\\\\\\\\n\\\\n\\n\n
      '' ''
        {"version":2,"type":"disk","device":"/dev/nvme0n1","stableId":"/dev/disk/by-id/nvme-Micron_MTFDKCD512QGN-1BN1AABLA_25465476450F","mountPoint":"","stats":false,"space":false,"displayName":"/dev/nvme0n1"}\\\\\\\\n\\\\n\\n\n
      '' ''
        {"version":2,"type":"disk","device":"/dev/nvme0n1p3","stableId":"/dev/disk/by-uuid/cb242bc3-1021-4631-9a0f-315a50d4a1e1","mountPoint":"","stats":false,"space":false,"displayName":"/dev/nvme0n1p3"}\\\\\\\\n\\\\n\\n\n
      '' ];
      diskshowdevicename = true;
      diskspacecolors = [ "0 0.8784313797950745 0.10588235408067703 0.1411764770746231" "15 1 0.47058823704719543 0" "30 0.9647058844566345 0.8274509906768799 0.1764705926179886" "50 0.18039216101169586 0.7607843279838562 0.4941176474094391" ];
      diskspacemonitor = "used";
      diskspacestatus = true;
      diskspaceunit = "numeric";
      diskstatscolors = [ "0 0.8784313725490196 0.10588235294117647 0.1411764705882353" ];
      diskstatsstatus = false;
      diskstatsunitmeasure = "auto";
      displaymode = "primary";
      gpucolors = [ "65 0.9647058844566345 0.8274509906768799 0.1764705926179886" "80 1 0.47058823704719543 0" "92 0.8784313797950745 0.10588235408067703 0.1411764770746231" ];
      gpudeviceslist = [ ''
        {"version":2,"type":"gpu","device":"amd:card2","name":"AMD GPU 0x1681","usage":false,"memory":false,"displayName":"AMD GPU 0x1681"}\\\\\\\\n\\\\n\\n\n
      '' ];
      gpumemorycolors = [];
      gpumemorydecimals = 1;
      gpustatus = true;
      iconsstatus = false;
      itemsposition = [ "cpu" "gpu" "ram" "swap" "stats" "space" "eth" "wlan" ];
      leftclickstatus = "resources";
      netautohidestatus = false;
      netethcolors = [];
      netethstatus = false;
      netunitmeasure = "auto";
      netwlancolors = [];
      netwlanstatus = false;
      ramalert = true;
      ramalertthreshold = 4;
      ramcolors = [ "0 0.14901961386203766 0.6352941393852234 0.4117647111415863" "4 0.34117648005485535 0.8901960849761963 0.5372549295425415" "8 0.9647058844566345 0.8274509906768799 0.1764705926179886" "12 1 0.47058823704719543 0" "15 0.8784313797950745 0.10588235408067703 0.1411764770746231" ];
      ramstatus = true;
      ramunit = "numeric";
      rightclickstatus = true;
      swapalert = true;
      swapalertthreshold = 4;
      swapcolors = [ "65 0.9647058844566345 0.8274509906768799 0.1764705926179886" "80 1 0.47058823704719543 0" "92 0.8784313797950745 0.10588235408067703 0.1411764770746231" ];
      swapstatus = false;
      swapunit = "numeric";
      swapwidth = 0;
      thermalcpucolors = [];
      thermalcputemperaturedeviceslist = [ ''
        {"version":2,"type":"thermal-cpu","name":"k10temp: Tctl","monitor":false,"path":"/sys/class/hwmon/hwmon3/temp1_input"}\\\\\\\\n\\\\n\\n\n
      '' ];
      thermalcputemperaturestatus = true;
      thermalcputemperaturewidth = 0;
      thermalgpucolors = [];
      thermalgputemperaturedeviceslist = [ ''
        {"version":2,"type":"thermal-gpu","device":"amd:card2","name":"AMD GPU 0x1681","monitor":false}\\\\\\\\n\\\\n\\n\n
      '' ];
      thermalgputemperaturestatus = true;
    };

    "org/gnome/shell/extensions/top-bar-organizer" = {
      center-box-order = [ "dateMenu" ];
      hide = [];
      left-box-order = [ "activities" ];
      right-box-order = [ "/org/gnome/Shell/Extensions/GSConnect/Device/4d77caa10877445aa8c2b2aee0656085" "appindicator-kstatusnotifieritem-vicinae" "appindicator-kstatusnotifieritem-vesktop_status_icon_1" "appindicator-kstatusnotifieritem-Syncthing Tray" "appindicator-kstatusnotifieritem-KDE Connect Indicator" "/org/gnome/Shell/Extensions/GSConnect/Device/6212c78c4de34ae7b1258632c46093f9" "/org/gnome/Shell/Extensions/GSConnect/Device/7a5b479c4c3f4082acc761ca3546fd53" "/org/gnome/Shell/Extensions/GSConnect/Device/c0b0c51d30f941608c3aa195c5e43211" "Resource_Monitor@Ory0n-primary-0" "lan-ip-address-indicator" "screenRecording" "screenSharing" "dwellClick" "a11y" "keyboard" "quickSettings" ];
      show = [];
    };

    "org/gnome/shell/keybindings" = {
      show-screen-recording-ui = [ "<Shift><Alt>Print" ];
      switch-to-application-1 = [];
      switch-to-application-2 = [];
      switch-to-application-3 = [];
      switch-to-application-4 = [];
      switch-to-application-7 = [];
      toggle-application-view = [ "<Super>a" ];
      toggle-message-tray = [ "<Super>v" ];
      toggle-overview = [];
    };

    "org/gnome/shell/weather" = {
      automatic-location = true;
      locations = [ (mkVariant [ (mkUint32 2) (mkVariant [ "Legan\233s" "LEVS" true [ (mkTuple [ 0.7045991230607519 (-6.606071218798538e-2) ]) ] [ (mkTuple [ 0.7039197012895356 (-6.577590936064494e-2) ]) ] ]) ]) ];
    };

    "org/gnome/shell/world-clocks" = {
      locations = [];
    };

    "org/gnome/software" = {
      check-timestamp = mkInt64 1788453285;
      first-run = false;
    };

    "org/gnome/tweaks" = {
      show-extensions-notice = false;
    };

    "org/gtk/gtk4/settings/color-chooser" = {
      custom-colors = [ (mkTuple [ 0.0 0.75 0.75 1.0 ]) (mkTuple [ 0.0 0.7 0.9 1.0 ]) (mkTuple [ 0.0 0.7 0.75 1.0 ]) (mkTuple [ 0.125 0.125 0.125 1.0 ]) (mkTuple [ 0.0 0.61 0.74 1.0 ]) ];
      selected-color = mkTuple [ true 0.752941 0.380392 0.796078 1.0 ];
    };

    "org/gtk/gtk4/settings/emoji-chooser" = {
      recently-used-emoji = [ (mkTuple [ (mkTuple [ [ (mkUint32 10004) 65039 ] "check mark" "check mark" [ "check" "checked" "checkmark" "done" "heavy" "mark" "tick" "10003" ] [ "check" "checked" "checkmark" "done" "heavy" "mark" "tick" "10003" ] (mkUint32 8) ]) (mkUint32 0) ]) (mkTuple [ (mkTuple [ [ 128077 127995 ] "thumbs up" "thumbs up" [ "+1" "good" "hand" "like" "thumb" "up" "yes" ] [ "+1" "good" "hand" "like" "thumb" "up" "yes" ] 1 ]) 0 ]) ];
    };

    "org/gtk/gtk4/settings/file-chooser" = {
      show-hidden = true;
    };

    "org/gtk/settings/color-chooser" = {
      selected-color = mkTuple [ true 1.0 1.0 1.0 1.0 ];
    };

    "org/gtk/settings/file-chooser" = {
      clock-format = "24h";
      date-format = "regular";
      location-mode = "path-bar";
      show-hidden = false;
      show-size-column = true;
      show-type-column = true;
      sidebar-width = 189;
      sort-column = "type";
      sort-directories-first = false;
      sort-order = "ascending";
      type-format = "category";
      window-position = mkTuple [ 26 23 ];
      window-size = mkTuple [ 1203 902 ];
    };

    "page/kramo/Cartridges" = {
      auto-import = true;
      cover-launches-game = true;
      desktop = true;
      flatpak-user-location = "/home/enzo/.local/share/flatpak";
      retroarch-location = "/home/enzo/.config/retroarch";
      sgdb = true;
      sgdb-key = "6716eea7a8a4586a0093298282615a64";
      sgdb-prefer = true;
      steam-location = "/home/enzo/.steam/steam";
    };

    "page/kramo/Cartridges/State" = {
      is-maximized = true;
      show-sidebar = false;
      sort-mode = "last_played";
      steam-limiter-tokens-history = "[1788449912.094165, 1788449927.4660656, 1788449927.4695482, 1788449927.4729114, 1788449927.4756386]";
    };

    "re/sonny/Junction" = {
      show-app-names = true;
    };

  };
}
