#!/bin/bash
entertext="and press [ENTER]: "
blankinputstext="Inputs cannot be blank, please input"
options="Show Add Delete Info MakeMD5Sum CheckMD5Sum Exit"
select opt in $options; do
    if [ "$opt" = "Exit" ]; then
     printf "See you next time\n"
     exit 1
    elif [ "$opt" = "Show" ]; then
     less baza.sh
    elif [ "$opt" = "Add" ]; then
     read -p "Enter number $entertext" no
     [ -z "$no" ] && printf "$blankinputstext number!" && read -p "Enter number $entertext" no
     read -r -p "Enter name $entertext" name
     [ -z "$name" ] && printf "$blankinputstext name!" && read -p "Enter name $entertext" name
     read -p 'Enter ip and press [ENTER]: ' ip
     [ -z "$ip" ] && printf "$blankinputstext ip!" && read -p "Enter first value $entertext" ip
     printf "$no. $name $ip" >> baza.sh
    elif [ "$opt" = "Delete" ]; then
     read -p "Enter line number to delete $entertext" delno
          [ -z "$no" ] && printf "$blankinputstext line number!" && read -p "Enter line number to delete $entertext" no
     sed -i ""$delno"d" baza.sh
    elif [ "$opt" = "Info" ]; then
     printf "Small BASH script to manipulate and use data in file baza.sh. For usage input option number $entertext\nAvailable options are:\n1) Show\n2) Add\n3) Delete\n4) Info\n5) MakeMD5Sum\n6) CheckMD5Sum\n7) Exit\n"
    elif [ "$opt" = "MakeMD5Sum" ]; then
     md5sum baza.sh > baza.sum
    elif [ "$opt" = "CheckMD5Sum" ]; then
     md5sum -c baza.sum
    else
     clear
     printf "Wrong option\nAvailable options are:\n1) Show\n2) Add\n3) Delete\n4) Info\n5) MakeMD5Sum \n6) MakeMD5Sum\n7) Exit\n. Choose option $entertext"
    fi
done
