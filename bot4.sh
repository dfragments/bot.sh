#!/bin/bash

while true
do
    echo "Starting bot at $(date)"

    # Use expect to handle the interactive prompts
    expect <<EOF &
spawn npm run start

# Handle the "Enter Referral Code" prompt
expect "Enter Referral Code:" { send "7VB64Z5B\r" }

# Wait for the "How many do you want?" prompt
expect "How many do you want?" { send "1000000\r" }

expect "Choose Captcha Metode" { send "1\r" }

# Allow time for the process to run
expect eof
EOF

    echo "Bot running for 5 hour..."
    sleep 18000

    # Kill the bot after 1 hour
    echo "Stopping bot at $(date)..."
    pkill -f "npm run start"

    echo "Waiting 5 hour before restarting..."
    sleep 18000
done


#chmod +x bot.sh && ./bot.sh
