#!/data/data/com.termux/files/usr/bin/bash
#fixing database error
#msfvenom and msfconsole

if [ -e $PREFIX/bin/msfdatabase ]
then
	cat $PREFIX/bin/msfdatabase
	echo ''
	echo -n "msfdatabase already exist read file "
	echo -n "want to delete file and create new one y/n :"
	read x
	if [ $x == "y" ] 
	then
		rm $PREFIX/bin/msfdatabase
	else
		exit 1
	fi
fi
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
	rm -rf /data/data/com.termux/files/usr/bin/msfdatabase
	touch $HOME/.script.sh
	chmod +x $HOME/.script.sh
	echo "pg_ctl -D /data/data/com.termux/files/usr/var/lib/postgresql start" >> .script.sh
	ln -s $HOME/.script.sh $PREFIX/bin/msfdatabase
	sleep 3
	if [ ! -e $PREFIX/bin/msfconsole ]
	then
        	ln -s $HOME/metasploit-framework/msfconsole $PREFIX/bin/msfconsole
	fi
	if [ ! -e $PREFIX/bin/msfvenom ]
	then
        	ln -s $HOME/metasploit-framework/msfvenom $PREFIX/bin/msfvenom
	fi
	echo ''
	echo "fixed msfvenom and msfconsole"
	echo "setup has been completed"
	echo "now execute msfdatabase"
	echo "this script will start database automatacally"
	echo ""
	exit 1
fi
if [ ! -e $PREFIX/bin/msfconsole ]
then
	ln -s $HOME/metasploit-framework/msfconsole $PREFIX/bin/msfconsole
fi
if [ ! -e $PREFIX/bin/msfvenom ]
then
	ln -s $HOME/metasploit-framework/msfvenom $PREFIX/bin/msfvenom
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
rm -rf /data/data/com.termux/files/usr/bin/msfdatabase
touch $HOME/.script.sh
chmod +x $HOME/.script.sh
echo "pg_ctl -D /data/data/com.termux/files/usr/var/lib/postgresql start" >> .script.sh
ln -s $HOME/.script.sh $PREFIX/bin/msfdatabase

sleep 3
echo ''
echo "fixed msfcvenom and and msfconsole"
echo "setup has been completed"
echo "now execute msfdatabase"
echo "this script will start database "

