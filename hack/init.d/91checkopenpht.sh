#!/bin/sh

# Check if we have OpenPHT installed on an external drive
for m in /tmp/mnt/*; do
	if [ -f ${m}/plexhometheater ]; then
		/etc/rc3.d/U94boxeehal stop > /dev/null
		/etc/rc3.d/U99boxee stop > /dev/null
		killall BoxeeHal 2> /dev/null
		killall BoxeeLauncher 2> /dev/null
		killall Boxee 2> /dev/null
		killall run_boxee.sh 2> /dev/null
		mount -o bind /data/hack/misc/plex.sh /opt/boxee/BoxeeLauncher
		/opt/boxee/BoxeeLauncher &
		exit
	fi
done
