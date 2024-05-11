#!/bin/bash

display_menu() {
    echo "User Account Management Tool"
    echo "1. Add a new user"
    echo "2. Delete a user"
    echo "3. Change user password"
    echo "4. List all users"
    echo "5. Exit"
}

add_user() {
    read -p "Enter username: " username
    sudo useradd -m $username
    echo "User $username added successfully."
}

delete_user() {
    read -p "Enter username to delete: " username
    sudo userdel -r $username
    echo "User $username deleted successfully."
}

change_password() {
    read -p "Enter username to change password: " username
    sudo passwd $username
}

list_users() {
    echo "List of all users:"
    cut -d: -f1 /etc/passwd
}

while true; do
    display_menu
    read -p "Enter your choice: " choice
    case $choice in
        1) add_user;;
        2) delete_user;;
        3) change_password;;
        4) list_users;;
        5) echo "Exiting..."; break;;
        *) echo "Invalid choice. Please try again.";;
    esac
done
