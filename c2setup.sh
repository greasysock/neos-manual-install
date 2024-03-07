#!/usr/bin/bash

set -e

DEFAULT_GITHUB_OWNER="dragonpilot-community"
DEFAULT_GITHUB_BRANCH="r2"

cd /data
rm -rf openpilot
rm -rf dragonpilot
time git clone https://github.com/${1:-$DEFAULT_GITHUB_OWNER}/dragonpilot.git -b ${2:-$DEFAULT_GITHUB_BRANCH} --recurse-submodules --depth 1 openpilot

cd /data/data/com.termux/files
echo $'#!/usr/bin/bash\n\ncd /data/openpilot\n./launch_openpilot.sh\n' > continue.sh
chmod +x continue.sh
echo "Installation complete. Rebooting..."
reboot
