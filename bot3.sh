#!/bin/bash

while true
do
    echo "Starting bot at $(date)"

    # Use expect to handle the interactive prompts
    expect <<EOF &
spawn npm start

# Handle the "Enter Referral Code" prompt
expect "Enter Referral Code:" { send "7s1PBfXL9\r" }

# Wait for the "How many do you want?" prompt
expect "How many do you want?" { send "1000000\r" }

# Allow time for the process to run
expect eof
EOF

    echo "Bot running for 1 hour..."
    sleep 3600

    # Kill the bot after 1 hour
    echo "Stopping bot at $(date)..."
    pkill -f "npm start"

    echo "Waiting 1 hour before restarting..."
    sleep 3600
done


#chmod +x bot.sh && ./bot.sh
