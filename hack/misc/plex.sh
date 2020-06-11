#!/bin/sh
if [ `ps -A | grep -c plexhometheater` -ge 1 ]; then
	exit
fi
while true
do
	for m in /tmp/mnt/*; do
		if [ -f ${m}/plexhometheater ]; then
			cd ${m}
			chmod +x ${m}/plexhometheater
                        HOME=${m} XBMC_USER_HOME=${m}/.plexht XBMC_TEMP=/tmp/plexht XBMC_HOME=${m} PYTHONOPTIMIZE=1 LD_LIBRARY_PATH=${m} ./plexhometheater --standalone -fs --lircdev /run/lirc/lircd 2>>/tmp/plexht.log
			ret=$?
			break
		fi
	done
	case "${ret}" in
		0 ) # Quit
			 ;;
		64 ) # Shutdown System
			poweroff
			break 2 
			;;
		65 ) # Warm Reboot
			;;
		66 ) # Reboot System
			reboot
			break 2 
			;;
		139 ) # Crashed so reboot
			reboot
			break 2
			;;
		* ) ;;
	esac
done
