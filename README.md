Hak5 Network Offline Archiver
====

This program downloads and organizes videos from the Hak5 network of shows.

Original idea by Phil Kauffman.
https://github.com/papamoose/hak5

My idea is to have Plex understand this archive on the disk.
We will see if that works out.



### Install

The program will probably only work on a Linux machine, but you can try on Windows or Mac if you want~
You will need Perl.

##### Ubuntu
`sudo apt-get install youtube-dl libconfig-simple-perl`
##### Fedora
`sudo yum install youtube-dl perl-Config-Simple`

`mkdir -p /storage/video/podcasts/Hak5` (Or whatever...)
`cd       /storage/video/podcasts/Hak5`
`git   clone https://github.com/nateinu/hak5`
`mv    hak5 code`



### Configure

Edit the hak5-download.cfg-example file.

`cd /storage/video/podcasts/Hak5/code` (Or whatever...)
`cp hak5-download.cfg-example hak5-download.cfg`
`vim hak5-download.cfg`

Set the download folder and which levels of subfolders you want.



### Usage

`cd /storage/video/podcasts/Hak5/code/bin` (Or whatever...)

##### Download everything, or just everything you don't already have
`./hak5-download`

##### Download one particular show
`./hak5-download --show Metasploit_Minute`

##### Download one particular episode from a show
`./hak5-download --show TekThing --episode 14`


