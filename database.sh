#!/data/data/com.termux/files/usr/bin/bash
#fixing database error

if [ ! -d $HOME/metasploit-framework ]
then
	echo ""
	echo "metasploit not found"
	echo "plz install metasploit framework"
	echo ""
	exit 1
fi
if [ -e $HOME/metasploit-framework/config/database.yml ]
then
	rm $HOME/metasploit-framework/config/database.yml
fi
if [ -d $PREFIX/var/lib/postgresql ]
then
	if [ -e $HOME/.script.sh ]
	then
		rm .script.sh
	fi
	if [ -e /data/data/com.termux/files/usr/bin/msfconsole ]
	then
		rm /data/data/com.termux/files/usr/bin/msfconsole
	fi
	touch $HOME/.script.sh
	chmod +x $HOME/.script.sh
	echo "pg_ctl -D /data/data/com.termux/files/usr/var/lib/postgresql start" >> .script.sh
	echo "cd /data/data/com.termux/files/home/metasploit-framework" >> .script.sh
	echo "clear" >> .script.sh
	echo "./msfconsole" >> .script.sh
	ln -s $HOME/.script.sh $PREFIX/bin/msfconsole
	sleep 3
	echo ''
	echo "setup has been completed"
	echo "now execute msfconsole"
	echo "this script will start database automatacally"
	echo "dumped details stored in /data/data/com.termux/files/home/metasploit-framework"
	exit 1
fi
echo "Creating database"

cd $HOME/metasploit-framework/config
curl -LO https://raw.githubusercontent.com/sachin175638/server1/master/database.yml

mkdir -p $PREFIX/var/lib/postgresql
initdb $PREFIX/var/lib/postgresql

pg_ctl -D $PREFIX/var/lib/postgresql start
createuser msf
createdb msf_database
if [ -e $HOME/.script.sh ]
then
	rm $HOME/.script.sh
fi
if [ -e /data/data/com.termux/files/usr/bin/msfconsole ]
then
	rm /data/data/com.termux/files/usr/bin/msfconsole
fi
touch $HOME/.script.sh
chmod +x $HOME/.script.sh
echo "pg_ctl -D /data/data/com.termux/files/usr/var/lib/postgresql start" >> .script.sh
echo "cd metasploit-framework" >> .script.sh
echo "./msfconsole" >> .script.sh
echo "cd /data/data/com.termux/files/home/metasploit-framework" >> .script.sh
echo "clear" >> .script.sh
echo "./msfconsole" >> .script.sh
ln -s $HOME/.script.sh $PREFIX/bin/msfconsole

sleep 3
echo ''
echo "setup has been completed"
echo "now execute msfconsole"
echo "this script will start database automatacally"
echo "dumped details stored in /data/data/com.termux/files/home/metasploit-framework"
