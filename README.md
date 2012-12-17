404Games - 404Wasteland(v2)
=============

404Wasteland:Chernarus Mission File

About
-----

Version 2 - This is a compleate recode by Deadbeat with the changes the community wanted.
Wasteland is a survival sandbox mission with hunger and thirst. Where you can build a base work as a team or go as a lone wolf, you have missions to keep you busy where you could find some people to hunt or just get some fancy toys to help you rule the server.

How To Host 404Wasteland
----------------------

1. If you own a dedicated server, you can follow the guide below and download our files and away you go.
2. Pop over to http://tinyurl.com/wastelandserverhosting and rent a easy and ready to go server.

How To Setup A 404Wasteland Server
----------------------

* Setup a arma2oa server. This can be compleated by downloading arma2 and arma2oa on to your server from somewhere like steam.
* Install Arma2 Beta - http://www.arma2.com/beta-patch.php
* Create a folder somewhere for your server to go. Copy all the files from "Arma 2 Operation Arrowhead" to your new folder, then copy the "Addons" folder from "Arma2"
* Download the latest version of 404Wasteland.

```
Basic/Update - Download the 404wasteland pack which includes the mission file, arma2net, bat script to start the server
and an example config.

http://www.404games.co.uk/forum/index.php?/topic/445-404wasteland-chernarus-v2-mission-requirements/
```

```
Advanced - Download the source from Github and then pack the files using PBOView (Warning builds from git are dev
build, we recommend downloading the stable build from our website)

https://github.com/domuk/404Wasteland-Chernarus/archive/master.zip
```

* Put the files into your arma2 server folder.
* Edit the "server.cfg" in the wastelands folder to your own liking.
* Arma2Net has two requirements, below are the download links to the C+ Redist and netframework 4. If these are installed please skip this step.

```
Arma2Net Requirements- 

http://www.microsoft.com/download/en/details.aspx?id=24872 

http://www.microsoft.com/en-us/download/details.aspx?id=8328
```

* OPTIONAL: You can download our battleye banlist/logfiles which contains our ban.txt and other script catching forms for battleye. They are all set to observe, you need to look at the generated *.log files to determine who/what has been hacking. You just need to copy the *.txt files in to your batteye folder. 

```
http://www.404games.co.uk/forum/index.php?/topic/445-404wasteland-chernarus-v2-mission-requirements/
```

The next step will change depending on how you host your server.

* Open the server.bat and edit the "IP=x.x.x.x" and you should be able to instantly launch the server.
* Login to your hosted control panel and on the game server and you will need to change the command line so that it loads "-mod=@Arma2NET"

Troubleshooting

* We had trouble getting battleye to start up with the server which meant we couldn't run Arma2 Rcon admin on the server. If you are having problems after setting your rcon password, then you might want to add the following to your startup "-bepath=C:\PATH\TO\BattlEye"We moved battleye into the wasteland folder on our server and pointed it to that.If you have any problems setting up your server, we will help you the best we can but cannot guarantee that your host/server will work as each setup varies. For support please use the 404games tech support forum located here http://www.404games....hnical-support/
* If you are getting waiting for host or the game is not loading correctly please make sure that you have copyied the "Addons" folder from Arma2 to your Arma2OA folder as it contains lots of the servers requirements. (Guide Link Coming Soon)
* If missions are running then randomly stopping please make sure that you have updated your build to the latest version of wastelands as we released a hotfix to fix a broken mission.
* If missions are not running and you have Arma2Net running please make sure you have installed the two following requirements of arma2net. http://www.microsoft.com/download/en/details.aspx?id=24872 and http://www.microsoft.com/en-us/download/details.aspx?id=8328

Previous Versions

* All other versions are avalible from http://www.404games.co.uk/wastelands