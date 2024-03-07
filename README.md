# neos-manual-install

Stuck here? You're not alone.

![Screenshot](neos-installer-stuck.jpg)

This repo contains a downloadable, executable script that bypasses NEOS Setup to install openpilot. This appears to be necessary as of late February 2024; the reason is not yet understood. This script is made specifically for NEOS devices (EON, comma two). This is NOT designed or needed for AGNOS devices such as comma three or threex.

# Basic usage

Installing stock openpilot 0.8.13.1.

1. Connect to Wi-Fi normally.
2. When connected, go to More Options.
3. Touch the triple-dot icon in the upper right corner, select Advanced.
4. Scroll down and note the IPv4 address, will look like "192.168.202.191".
5. Download the [default/setup SSH key](https://github.com/commaai/openpilot/blob/master/tools/ssh/id_rsa). SSH is always enabled with this key while in NEOS Setup.
6. Connect to that IP using SSH, or use [Openpilot Toolkit](https://github.com/spektor56/OpenpilotToolkit). 
7. Paste this command into your SSH session: `curl -Ls [https://tinyurl.com/bdhse3xn](https://raw.githubusercontent.com/dogtreatfairy/neos-manual-install/main/c2setup.sh) | bash -e`

# Advanced usage

Let's be honest, we're here because you were tempted to uninstall openpilot and try some other random fork!
The installer script above will accept two optional parameters, a GitHub repository owner and a branch name. This mirrors the format used by comma's install generator.

Where you would normally use the install URL: `https://installer.comma.ai/commaai/release2`

Use this command instead: `curl -Ls https://tinyurl.com/bdhse3xn | bash -e commaai release2`
