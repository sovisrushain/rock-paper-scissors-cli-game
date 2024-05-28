#!/bin/bash

# Function to display the menu
display_menu() {
    echo "Rock, Paper, Scissors Game"
    echo "1) Rock"
    echo "2) Paper"
    echo "3) Scissors"
    echo "4) Quit"
    echo -n "Choose an option: "
}

# Function to get the computer's choice
get_computer_choice() {
    local choices=("Rock" "Paper" "Scissors")
    echo "${choices[$((RANDOM % 3))]}"
}

# Function to determine the winner
determine_winner() {
    local player_choice=$1
    local computer_choice=$2

    if [[ "$player_choice" == "$computer_choice" ]]; then
        echo "It's a tie!"
    elif [[ ("$player_choice" == "Rock" && "$computer_choice" == "Scissors") ||
            ("$player_choice" == "Paper" && "$computer_choice" == "Rock") ||
            ("$player_choice" == "Scissors" && "$computer_choice" == "Paper") ]]; then
        echo "You win! $player_choice beats $computer_choice."
    else
        echo "You lose! $computer_choice beats $player_choice."
    fi
}

# Main game script
while true; do
    display_menu
    read -r choice

    case $choice in
        1)
            player_choice="Rock"
            ;;
        2)
            player_choice="Paper"
            ;;
        3)
            player_choice="Scissors"
            ;;
        4)
            echo "Goodbye!"
            break
            ;;
        *)
            echo "Invalid choice. Please try again."
            continue
            ;;
    esac

    computer_choice=$(get_computer_choice)
    echo "Computer chose: $computer_choice"
    determine_winner "$player_choice" "$computer_choice"
done
