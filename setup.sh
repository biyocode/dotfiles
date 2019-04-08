#!/usr/bin/env bash
# Setup for bashr and vimrc
echo "Which files do you want to setup? ex. 'bashrc vimrc'"
echo "    -> Avaliable files: bashrc vimrc"
read -r input_list

# Convert string to array
IFS=' ' read -r -a file_list <<< "$input_list"

for i in "${file_list[@]}"
do
    if $i == "bashrc"
    then
        echo "Which linux distro are you using? ex. 'arch'"
        echo "    -> Avaliable distros: arch, kali, ubuntu"
        read -r input_distro
        if $input_distro == "arch"
        then
            sed -n '2p' bashrc >> ~/.bashrc
        fi
        if $input_distro == "kali"
        then
            sed -n '5p' bashrc >> ~/.bashrc
        fi
        if $input_distro == "ubuntu"
        then
            sed -n '8p' bashrc >> ~/.bashrc
        fi

        # Insert custom alias to the bottom of bashrc
        sed -n '10p,18p' bashrc >> ~/.bashrc
    fi

    if $i == "vimrc"
    then
        if ! find ~ -name .vimrc | grep -q ".vimrc"
        then
            cp vimrc ~/.vimrc
        else
            sort -u vimrc ~/.vimrc > ~/.vimrc
        fi
    fi
done
