{ config, pkgs, lib, ... }:

let

  perform_rsync = pkgs.writeScriptBin "perform_rsync" ''
     #!/bin/bash

     # Tolga Erok
     # 11/5/2023
     # About:
     #   Personal RSYNC script that only rsyncs selected folders listed in INCLUDE_FOLDERS variables
     #   excluding ALL hidden files and folders from /home/tolga/ to //192.168.0.3/LinuxData/HOME/tolga

     DEST_DIR="/mnt/smb-rsync/"
     USERNAME="tolga"
     SERVER_IP="192.168.0.20"

     # MOUNT_OPTIONS="credentials=/etc/nixos/network/smb-secrets,uid=$USER,gid=samba,file_mode=0777,dir_mode=0777"
     MOUNT_OPTIONS="credentials=/etc/nixos/system/network/smb-secrets,uid=$USER,gid=samba,vers=3.1.1,cache=loose,file_mode=0777,dir_mode=0777"

     # Function to print colored output


     # Reload daemon, fstab, and mount -a
     sudo systemctl daemon-reload && sudo mount -a

     # Unmount smb share
     perform_unmount() {
         sudo umount -f /mnt/*
         sudo umount -l /mnt/*
     }

     perform_unmount

     # Reload daemon and fstab
     perform_reload() {
         sudo systemctl daemon-reload
     }

     # Function to perform rsync
     perform_rsync() {
         # mount smb share
         sudo mount -t cifs //$SERVER_IP/LINUXDATA2/HOME/PROFILES/"$distro"/TOLGA/ $DEST_DIR -o "$MOUNT_OPTIONS"

         # rsync with --exclude option to skip hidden files/folders
         echo -e "\e[1;34mSyncing $SOURCE_DIR/ $DEST_DIR/ ...\e[0m"
         rsync -avz --no-links --progress --partial --partial-dir=.rsync-partial --bwlimit=500M --no-compress --relative --hard-links --exclude ".*" --update --stats "$SOURCE_DIR/" "$DEST_DIR/"
         echo -e "\e[1;31mFinished syncing $SOURCE_DIR/ $DEST_DIR/\e[0m"
         sleep 1
         echo 
             
         echo -e "Press Enter to go back to the menu." 
         read -r -s
         perform_unmount
         clear
     }

     # Get the current user's home directory using the user ID 1000
     USERNAME=$(id -u -n 1000)
     SOURCE_DIR="/home/$USERNAME"

     # set variables
     INCLUDE_FOLDERS=()

     populate_include_folders() {
         while IFS= read -r folder; do
             INCLUDE_FOLDERS+=("$(basename "$folder")")
         done < <(find "$SOURCE_DIR" -maxdepth 1 -mindepth 1 -type d \( ! -iname ".*" \))
     }

     perform_unmount
     while true; do
         clear
         # Populate INCLUDE_FOLDERS before the rsync loop
         populate_include_folders

         # Menu options
         echo -e "\n\e[1;31mRSYNC from /home/tolga > W11:\e[0m"
         echo -e "\e[1;34mPlease select a Linux distribution profile:\e[0m"
         echo "1. Fedora"
         echo "2. NixOS" 
         echo "3. RHEL 9.2" 
         echo "4. Mint" 
         echo "5. Start again"
         echo "6. Exit"
         read -r -p "Enter your choice: " choice

         case $choice in
         1)
             distro="FEDORA"
             ;;
         2)
             distro="NIXOS-23-05"
             ;;
         3)
             distro="RHEL-9"
             ;;
         4)
             distro="MINT"
             ;;
         5)
             clear
             perform_unmount
             continue
             ;;
         6)
             echo "Exiting..."
             perform_unmount
             exit 0
             ;;
         *)
             echo "Invalid choice. Please try again."
             continue
             ;;
         esac

         clear

         perform_unmount
         perform_rsync "$distro"

         clear
     done
  '';

in {

  # Type: perform_rsync in terminal to execute the bash script
  environment.systemPackages = [ perform_rsync ];

}
