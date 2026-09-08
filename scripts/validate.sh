#!/usr/bin/env bash
set -euo pipefail

plugin_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)
omarchy plugin validate "$plugin_dir"

# BarWidget.qml is unmodified from Omarchy's built-in omarchy.clock and trips
# qmllint in some environments (it does the same for the shipped original),
# so only the file this plugin actually changes is linted here.
qmllint -I "$OMARCHY_PATH/shell" "$plugin_dir/Panel.qml"
