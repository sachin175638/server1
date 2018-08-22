#!/usr/bin/bash
#apt-get install git -y
if [ -d $HOME/server1 ]
then
	rm -rf $HOME/server1
fi
if [ -d $HOME/server ]
then
        rm -rf $HOME/server
fi
git clone https://github.com/sachin175638/server1.git
cd server1
unzip server.zip
cd server
chmod +x setup.sh
sh setup.sh
rm -rf $HOME/server1
