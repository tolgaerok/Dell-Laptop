my setup in that file  is  "vm.vfs_cache_pressure" = 50;

did you read the notes i had in that file?

set the value to 300 for the apple

and say 100  -  150 for the thinkpad

i have 32gb on main rig and had it to 1, so basically what that does it works everything in ram

and hardly uses ssd to save wear and tear

 
 off with 250 - 300 for apple laptop and about 100 - 150 for the 16Gb one

 
"vm.dirty_background_bytes" = 268435456;  # 256 MB in bytes, data that has been modified in memory and needs to be written to disk
    "vm.dirty_bytes" = 1073741824;            # 1 GB in bytes, data that has been modified in memory and needs to be written to disk

this section is for writing data to USB

linux has a 10000000 year old bug

it writes to cache in 1 sec but takes like for ever to write to usb

make you think its already written and u accidently pull it out

"vm.dirty_background_bytes" = 16777216;
            "vm.dirty_bytes" = 50331648;

So, "vm.dirty_background_bytes" is approximately 16 MB, and "vm.dirty_bytes" is approximately 48 MB.

in other words when x amount of MB is inserted into cache, start writing it

1 MB (megabyte) = 1,048,576 bytes

to convert bytes to megabytes, you divide the number of bytes by 1,048,576.

For "vm.dirty_background_bytes":
16,777,216 bytes ÷ 1,048,576 bytes/MB = 16 MB

 
For "vm.dirty_bytes":
50,331,648 bytes ÷ 1,048,576 bytes/MB = 48 MB

Ive just added info into my kernel-sysctl to explain in greater detail, about to upload

 
system/kernel-sysctl

ok i uploaded the info

system/kernel-sysctl/default.nix

once your happy and all is working WELL after reboots etc, then clean out all the cruff by running

rebuild-all

then reboot system 
