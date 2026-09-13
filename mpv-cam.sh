#!/usr/bin/env bash
# @vicinae.schemaVersion 1
# @vicinae.title MPV Cámara
# @vicinae.mode silent
# @vicinae.exec ["/usr/bin/env", "bash"]

mpv av://v4l2:/dev/video0 --profile=low-latency --vf=hflip --untimed --no-correct-pts --opengl-glfinish=yes --no-audio --force-seekable=yes