BoxeeHack
=========

The BoxeeBox is quite a capable media player. At its core, it's a modified version of XBMC with a number of social media sharing features added on. However, those modifications also limit what you can do with the Box, and removes some of the standard XBMC features.

A while ago, a hack was discovered that allows for full root access to the box:
http://www.gtvhacker.com/index.php/Boxee

This project is an attempt at re-adding some of the missing features and opening up a development path for creating new features and fixing existing annoyances.

What does it do?
----------------

  - Root access telnet support (password is `secret`)
  - FTP server
  - Music icon added to the main screen and menu
  - Fanart on movie details page
  - Fanart on TV show overview page
  - 3D Movie overlay icon
  - Music / Concert overlay icon
  - Extra view mode for movies (small posters)
  - Mark all TV Show episodes watched or unwatched with one button
  - Custom browser homepage
  - More music visualisers (+ customisable)
  - Updated busybox, and added git, nano and sqlite3 tools
  - Improved buffering for Full HD videos
  - Tweaked MTU if you're using a VPN/PPP connection
  - Rewritten subtitle system (BierDopje, OpenSubtitles, Subtitulos, SubsWiki, Addic7ed)
  - Bespoke BoxeeHack settings menu
  - Reboot option
  - No more forced updates (as if that matters, though...)
  - Check for new versions (again, as if that matters.)

Requirements
------------
Of course, you'll need a Boxee Box for this. You'll also need an empty/unused USB drive.

Also, make sure you are on the latest firmware (1.5.1), since this hack has only been tested with that version. In particular, some skin features are used that will probably not work on older Boxee builds, and even may leave your box in an unbootable state, requiring you to do a factory reset.

The exact version needed can be downloaded using the link below, then installed through recovery mode:
https://drive.google.com/file/d/1M2dkj9r7Pan7svTfFqmHveE8FJUEbkfX/view?usp=share_link

Installing
----------
Let's get installing! First, format your USB drive. (ANY DATA ON IT WILL BE LOST IF YOU DON'T BACK IT UP!) Name the volume BOXEE. Next, download the ZIP directly from this page, and put the contents of the "install" folder on the USB drive. (DON'T USE THE RELEASE FOLDER, THAT'S FOR THE SCRIPT TO USE BECAUSE GITHUB DOESN'T LIKE IT ANYMORE)

If you're following correctly, these files should be at the root of your drive:
  - [support]
  - debug.sh
  - install.sh
  - uninstall.sh
  
If you'd like to install a specific version of the hack, you can also drop the "hack" folder in the root of the drive. Otherwise, it'll download the latest version from the GitHub.


On your Boxee Box, go to Settings > Network > Servers. Check "Enable Windows file sharing." in the "Host Name" field, enter this (preferably with a keyboard):

`boxeebox; sh /media/BOXEE/install.sh`

As soon as you back out of that menu, you should see the logo on the box turn red. That means the script is running - this should take a while if you didn't give it a preset [hack] folder. After it's done, the device should restart, and if all goes well, you'll see the "BOXEE+HACKS" splash!


See: http://www.youtube.com/watch?v=6YrjAqPqM30 for a video walkthrough of the process on the Boxee Box
See: http://boxeed.in/forums/viewforum.php?f=5 for additional help and information.
See: http://boxeed.in/ for other info.

If for some reason the hack disappears (which is still an issue that'll probably never be fully fixed), go back into Settings > Network > Servers and enter `boxeebox; sh /data/hack/boot.sh` - after another reboot, the hack should work (again).

Uninstall
---------

There are two ways to disable this hack if you want to. The quick way is to go into Settings -> Network -> Servers, and enter a new hostname (which now contains the hack), just remove everything in the edit field and type e.g. boxeebox. Then switch the boxee box off and back on again. You now no longer have the hack running, and everything should be back to normal.


You can also re-enable it by changing the host name to this:

`; sh /data/hack/boot.sh;`

If you want to _completely_ uninstall BoxeeHack (for some reason), an uninstall script is provided as well. Just go into Settings > Network > Servers and change your hostname into `boxeebox; sh /media/BOXEE/uninstall.sh`.


If you'd prefer, you can also uninstall manually. Here's how:

Log in to the boxee box over telnet with: `telnet [your-boxee-ip] 2323`

Type in the password `secret`

Edit the boxeehal.conf file in `/data/etc/boxeehal.conf` using either vi or nano, and remove the hack from the password field (or use the earlier instructions to disable the hack, however without rebooting).
Then remove the hack with `rm -Rf /data/hack`
