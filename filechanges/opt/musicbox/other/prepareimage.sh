#!/bin/bash
#
# MusicBox image clean and preparation script
#
apt-get remove build-essential git gcc cpp debian-reference-common g++ make ttf-bitstream-vera linux-libc-dev python-dev
apt-get remove .*-dev
apt-get autoremove
apt-get autoclean
apt-get clean

#fix stream link
rm /var/lib/git/Mopidy-MusicBox-Webclient/mopidy_musicbox_webclient/static/js/streamuris.js
ln -fsn /boot/config/streamuris.js /var/lib/git/Mopidy-MusicBox-Webclient/mopidy_musicbox_webclient/static/js/streamuris.js