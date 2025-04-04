#!/bin/bash

BOT_NAME="python3 bot.py"

while true; do
    # Start the bot and pass "3" as input
    echo "3" | $BOT_NAME &  
    BOT_PID=$!  # Get the bot's process ID

    echo "ߚ Bot started with PID: $BOT_PID"

    # Monitor logs for "Login Failed"
    tail -f bot.log | while read -r line; do
        if [[ "$line" == *"Login Failed"* ]]; then
            echo "⚠️ Login Failed detected! Restarting bot..."
            kill $BOT_PID  # Kill the bot
            sleep 3  # Wait before restarting
            break  # Exit the log monitoring loop to restart the bot
        fi
    done
done

