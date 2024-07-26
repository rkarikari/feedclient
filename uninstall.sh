#!/bin/bash
set -x

IPATH=/usr/local/share/adsb9g

systemctl disable --now adsb9g-mlat
systemctl disable --now adsb9g-mlat2 &>/dev/null
systemctl disable --now adsb9g-feed

if [[ -d /usr/local/share/tar1090/html-adsbx ]]; then
    bash /usr/local/share/tar1090/uninstall.sh adsbx
fi

rm -f /lib/systemd/system/adsb9g-mlat.service
rm -f /lib/systemd/system/adsb9g-mlat2.service
rm -f /lib/systemd/system/adsb9g-feed.service

cp -f "$IPATH/adsbx-uuid" /tmp/adsbx-uuid
rm -rf "$IPATH"
mkdir -p "$IPATH"
mv -f /tmp/adsbx-uuid "$IPATH/adsbx-uuid"

set +x

echo -----
echo "adsb9g feed scripts have been uninstalled!"
