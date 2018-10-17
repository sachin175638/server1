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
if [ ! -e $PREFIX/bin/git ]
then
        apt-get install git -y
fi
git clone https://github.com/sachin175638/server1.git
cd server1
unzip server.zip
cp version.txt server
cd server
if [ ! -e modules/version.txt ]
then
	rm modules/version.txt
fi
mv version.txt modules
chmod +x setup.sh
sh setup.sh
rm -rf $HOME/server1
