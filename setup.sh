#!/bin/bash

<<INSTALLER
sudo apt -qq update &&
sudo apt -qqy install git &&
git clone https://github.com/SaturnSoftware/.dotfiles.git &&
cd .dotfiles &&
chmod +x setup.sh &&
./setup.sh
INSTALLER

echo -n "[sudo] password for $USER: "
stty -echo

#Read Password
charcount=0
while IFS= read -p "$prompt" -r -s -n 1 ch
do
#Enter
    if [[ $ch == $'\0' ]]; 
    then
        break
    fi
#Backspace
    if [[ $ch == $'\177' ]];
    then
        if [ $charcount -gt 0 ];
        then
            charcount=$((charcount-1))
            prompt=$'\b \b'
            password="${password%?}"
        else
            PROMPT=''
        fi
    else
        charcount=$((charcount+1))
        prompt='*'
        password+="$ch"
    fi
done
stty echo
echo $password | sudo -S cat ../test.txt

if hash wget;
then
    echo "Wget found."
    else
    echo "Wget not found."
    echo "Refreshing Packages..."
    sudo apt-get -qq update
    echo "Installing..."
    sudo apt-get -qqy install wget gnupg2
    echo "Done."
fi
if hash mkrc;
then
    echo "RCM found."
    else
    echo "RCM not found."
    if hash apt-get;
    then
        echo "Adding RCM to debian repos."
        wget -qO - https://apt.thoughtbot.com/thoughtbot.gpg.key | sudo apt-key add -
        echo "deb https://apt.thoughtbot.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/thoughtbot.list
        echo "Refreshing Packages..."
        sudo apt-get -qq update
        echo "Installing..."
        sudo apt-get -qqy install rcm
        echo "Done."
    fi
fi
