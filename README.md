# 🚽 Clean Memory

## Description
This script contains a collection of commands that are used to update system resources and software.

## Usage
To run the script, simply execute `./script_name.sh`

## Permission 
`sudo chmod 755 clean_memory.sh`

## Commands
- `sudo purge`
- `sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder`
- `cd ~/Library/Logs`
- `sudo rm -rf ~/Library/Logs/*`
- `sudo rm -rf /private/var/log/*`

## Note
Please make sure to update the version of the commands in the `commands` array if you're using a different version of macOS or OS X.
