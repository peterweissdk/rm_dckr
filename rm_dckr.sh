#!/bin/bash
# ----------------------------------------------------------------------------
# Script Name: rm_dckr.sh
# Description: Tool designed to help you clean up Docker resources
# Author: peterweissdk
# Email: peterweissdk@flems.dk
# Date: 2025-01-06
# Version: v1.1.0
# Usage: Run script, follow instructions or -h for help
# ----------------------------------------------------------------------------

# Installs script
install() {
    read -p "Do you want to install this script? (yes/no): " answer
    case $answer in
        [Yy]* )
            # Set default installation path
            default_path="/usr/local/bin"
            
            # Prompt for installation path
            read -p "Enter the installation path [$default_path]: " install_path
            install_path=${install_path:-$default_path}  # Use default if no input

            # Get the filename of the script
            script_name=$(basename "$0")

            # Copy the script to the specified path
            echo "Copying $script_name to $install_path..."
            
            # Check if the user has write permissions
            if [ ! -w "$install_path" ]; then
                echo "You need root privileges to install the script in $install_path."
                if sudo cp "$0" "$install_path/$script_name"; then
                    sudo chmod +x "$install_path/$script_name"
                    echo "Script installed successfully."
                else
                    echo "Failed to install script."
                    exit 1
                fi
            else
                if cp "$0" "$install_path/$script_name"; then
                    chmod +x "$install_path/$script_name"
                    echo "Script installed successfully."
                else
                    echo "Failed to install script."
                    exit 1
                fi
            fi
            ;;
        [Nn]* )
            echo "Exiting script."
            exit 0
            ;;
        * )
            echo "Please answer yes or no."
            install
            ;;
    esac

    exit 0
}

# Updates version of script
update_version() {
    # Extract the current version from the script header
    version_line=$(grep "^# Version:" "$0")
    current_version=${version_line#*: }  # Remove everything up to and including ": "
    
    echo "Current version: $current_version"
    
    # Prompt the user for a new version
    read -p "Enter new version (current: $current_version): " new_version
    
    # Update the version in the script
    sed -i "s/^# Version: .*/# Version: $new_version/" "$0"
    
    echo "Version updated to: $new_version"

    exit 0
}

# Prints out version
version() {
    # Extract the current version from the script header
    version_line=$(grep "^# Version:" "$0")
    current_version=${version_line#*: }  # Remove everything up to and including ": "
    
    echo "Script version: $current_version"

    exit 0
}

# Prints out help
help() {
    echo "Run script to setup a new shell script file."
    echo "Usage: $0 [-i | --install] [-u | --update-version] [-v | --version] [-h | --help]"

    exit 0
}

# Check for flags
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -i|--install) install; shift ;;
        -u|--update-version) update_version; shift ;;
        -v|--version) version; shift ;;
        -h|--help) help; shift ;;
        *) echo "Unknown option: $1"; help; exit 1 ;;
    esac
done

# Function to prompt for user confirmation with a default of 'y'
confirm() {
    read -p "$1 (y/n, default is y): " -r
    REPLY=${REPLY:-y}  # Set REPLY to 'y' if it's empty
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        return 0  # User accepted
    else
        return 1  # User declined
    fi
}

# Prompt to remove all Docker containers
if confirm "Are you sure you want to remove all Docker containers, including those that are currently running?"; then
    # Remove all Docker containers
    docker rm -vf $(docker ps -aq)
    echo "All Docker containers have been removed."
else
    echo "Skipping removal of Docker containers."
fi

# Prompt to remove all Docker images
if confirm "Are you sure you want to remove all Docker images from your local Docker environment?"; then
    # Remove all Docker images
    docker rmi -f $(docker images -aq)
    echo "All Docker images have been removed."
else
    echo "Skipping removal of Docker images."
fi

# Prompt to remove all Docker networks
if confirm "Are you sure you want to remove all Docker networks?"; then
    # Remove all Docker networks
    docker network prune -f
    echo "All Docker networks have been removed."
else
    echo "Skipping removal of Docker networks."
fi

# Prompt to remove all Docker volumes
if confirm "Are you sure you want to remove all Docker volumes?"; then
    # Remove all Docker volumes
    docker volume prune -f
    echo "All Docker volumes have been removed."
else
    echo "Skipping removal of Docker volumes."
fi

