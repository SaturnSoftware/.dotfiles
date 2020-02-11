#!/bin/bash

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
        echo "Updating Package lists..."
        sudo apt-get -qq update
        echo "Installing..."
        sudo apt-get -qqy install rcm
        echo "Done."
    fi
fi
if hash wget;
then
    echo "wget found."
    else
    echo "wget not found."
    echo "Installing..."
    sudo apt-get -qq 
    echo "Done."
fi
