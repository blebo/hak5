Hak5 Network Offline Archiver
====

This program downloads and organizes videos from the Hak5 network of shows.

Original idea by Phil Kauffman.
https://github.com/papamoose/hak5

My idea is to have Plex understand this archive on the disk.
We will see if that works out.

Supported shows include:
- Hak5
- HakTip
- Metasploit_Minute
- Pineapple_University
- TekThing
- Threat_Wire



### Install

The program will probably only work on a Linux machine, but you can try on Windows or Mac if you want~

You will need Perl.

##### Ubuntu
`sudo apt-get install git youtube-dl libconfig-simple-perl`
##### Fedora
`sudo yum install git youtube-dl perl-Config-Simple perl-Digest-MD5 perl-Digest-SHA`
##### Both
`git clone https://github.com/nateinu/hak5`

`cd hak5`



### Configure (Optional)

- Set the download folder.
- Select which levels of subfolders you want to organize the files with.
- Set maximum number of threads to use when hashing.

`cp hak5-download.cfg-example hak5-download.cfg`

Edit the hak5-download.cfg file.

`gedit hak5-download.cfg`



### Usage

##### Update meta-files from GitHub
`git pull`

##### Download everything you don't already have
`./bin/hak5-download`

##### Download one particular show
`./bin/hak5-download --show Metasploit_Minute`

##### Download one particular episode from a show
`./bin/hak5-download --show TekThing --episode 14`

The "--episode" flag uses regex, not numbers. This means *crazy* things can happen. (Or if you know regex, you can download season 18 of Hak5 for example. '--18..--')



### Advanced Usage

##### Update meta-files by scraping web
`./bin/hak5-update`

##### Check file hashes
`./bin/hak5-hash --check --md5`

or

`./bin/hak5-hash --check --sha256`

##### Make file hashes
`./bin/hak5-hash --make`

##### Watch files over ssh with ascii and audio

Instructions below are tested for when client and server are running Ubuntu 14.04.

TODO: Figure out how to get vlc to transcode the audio to a lower bitrate on the fly.

```
sudo apt-get install socat
socat TCP-LISTEN:22255,fork UNIX-CONNECT:$(pax11publish | awk -F ":" '{print $3; exit}') &
ssh -R 22255:localhost:22255 <user>@<server>
sudo apt-get install vlc libaa1-dev libcaca-dev
./bin/hak5-watch --show Metasploit_Minute --episode 34
```

or

`./bin/hak5-watch --show Metasploit_Minute --episode 34 --color`



