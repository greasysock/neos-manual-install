#!/usr/bin/bash

set -e

DEFAULT_GITHUB_OWNER="dragonpilot-community"
DEFAULT_GITHUB_BRANCH="r2"

echo "Select an option:"
echo "1. Dragon Pilot - R2"
echo "2. Dragon Pilot - Deprecated-Release2 (dogtreatfairy)"
echo "3. Open Pilot - 0.8.13 (Stock)"
read -p "Enter your choice (1/2/3): " OPTION

case $OPTION in
    1)
        GITHUB_USER="dragonpilot-community"
        BRANCH="r2"
        REPO="dragonpilot.git"
        ;;
    2)
        GITHUB_USER="dogtreatfairy"
        BRANCH="deprecated-release2"
        REPO="dragonpilot.git"
        ;;
    3)
        GITHUB_USER="commaai"
        BRANCH="release2"
        REPO="openpilot.git"
        ;;
    *)
        echo "Invalid option. Exiting."
        exit 1
        ;;
esac

cd /data
rm -rf openpilot
time git clone https://github.com/$GITHUB_USER/$REPO -b $BRANCH --recurse-submodules --depth 1 openpilot

cd /data/data/com.termux/files
echo $'#!/usr/bin/bash\n\ncd /data/openpilot\n./launch_openpilot.sh\n' > continue.sh
chmod +x continue.sh
echo "Installation complete. Rebooting..."
reboot
