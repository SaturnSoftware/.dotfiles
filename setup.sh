#!/bin/bash

if hash mkrc && [ "$1" != "-f" ];
then
    echo "RCM found."
    else
    echo "RCM not found."
    if hash apt-get;
    then
        echo "Adding RCM to debian repos."
        {
        wget -qO - https://apt.thoughtbot.com/thoughtbot.gpg.key | sudo apt-key add -
        echo "deb https://apt.thoughtbot.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/thoughtbot.list
        } &> /dev/null
        echo "Updating Package lists..."
        sudo apt-get -qq update
        echo "Installing..."
        sudo apt-get -qqy install rcm
    fi
fi
