#!/bin/bash

if [!mkrc -V]
then
    echo "RCM not found."
    if [apt-get -v]
    then
        echo "Adding RCM to debian repos."
        wget -qO - https://apt.thoughtbot.com/thoughtbot.gpg.key | sudo apt-key add -
        echo "deb https://apt.thoughtbot.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/thoughtbot.list
        sudo apt-get update
        echo "Installing..."
        sudo apt-get -y install rcm
    fi
fi