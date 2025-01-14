#!/bin/bash

start_time=$(date +%s)
progress=0
total_commands=5
commands=(
"sudo purge"
"sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"
"cd ~/Library/Logs"
"sudo rm -rf ~/Library/Logs/*"
"softwareupdate -l"
)

for command in "${commands[@]}"
do
  output=$(eval "$command" 2>&1)
  echo "Output: $output"

  if [[ $? -ne 0 ]]
  then
    echo "Command failed: $command"
    echo "Exit status: $?"
    echo "Output: $output"
    exit 1
  fi
  
  progress=$((progress + 1))
  percentage=$((progress * 100 / total_commands))
  printf "Progress: [%-30s] %d%% %s\r" "Processing" "$percentage" "$command"
  printf "\n"
done

end_time=$(date +%s)
elapsed_time=$((end_time - start_time))
expected_time=$((60 * 9 / 10))

if [[ $elapsed_time -gt $expected_time ]]
then
  echo "Script took longer than expected to complete."
else
  echo "Script completed successfully after $elapsed_time seconds."
fi

echo "Loading..."
for i in {1..6}
do
  printf "."
  sleep 1
done
echo "Done!"
