#!/bin/env bash
# @vicinae.schemaVersion 1
# @vicinae.title Buscar en Obsidian
# @vicinae.mode fullOutput
# @vicinae.exec ["/usr/bin/env", "bash"]

cd "/home/enzo/Documents/Notas de obsidian/"
grep -R "$1" *
