#!/bin/bash

if [ -z $1 ]; then
    echo -e "You must specify an argument as follow----> \n enter 1 for all(Installation+check)\n or \n 2 to only check wifi link up or not."
    exit 100
fi
checker(){
    output=$(iw dev wlo1 scan)
        if [[ $output ]]; then
             echo "Success............."
             read -p "press enter to exit"
        else
           echo "Command failed,Sir.what to do now?.. want reboot? press Y..........."
            read Varcom
            if [ [$Varcom == Y] ]; then
                reboot;
            else
                echo 'Exiting...'
                exit 0 ;
            fi
        fi
    }
case $1 in
    1)
        cd '/root/rtl/rtlwifi_new-master';  #cd to extracted directory of drivers.
        make clean;  # if you tried installing same drivers already then "clean" comes handy.
        make install;
        modprobe -rv rtl8723be;
        modprobe -v rtl8723be ;
        sleep 4
        checker
        ;;
    2)
        checker
        ;;
    *)
        echo -e "$1 is not recognized !!! try only 1 or 2 option.\n"
        echo -e "You must specify an argument as follow----> \n enter 1 for all(Installation+check)\n or \n 2 to only check wifi link up or not."
esac
