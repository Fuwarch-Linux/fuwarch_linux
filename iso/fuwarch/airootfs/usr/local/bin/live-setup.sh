#!/bin/bash
set -euo pipefail
if ! id fuwa &>/dev/null; then
    useradd -m -G wheel,video,audio,network,optical,storage -s /bin/bash fuwa
    echo 'fuwa:fuwa' | chpasswd
    echo 'fuwa ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/live-fuwa
    chmod 0440 /etc/sudoers.d/live-fuwa
fi
