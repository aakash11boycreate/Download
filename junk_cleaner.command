
#!/bin/bash

# Script Name: Junk Cleaner for macOS
# Purpose: Clean up system junk and free up RAM
# Author: [Your Name]
# Website: https://aakashrahsi.online/

# Function to display progress
progress_bar() {
  local duration=${1:-3}
  local interval=0.2
  local ticks=$((duration / interval))
  printf "\nCleaning in progress: "
  for ((i=0; i<ticks; i++)); do
    printf "."
    sleep $interval
  done
  printf " Done!\n"
}

# Function to clean user cache
clean_user_cache() {
  echo "Cleaning user cache..."
  rm -rf ~/Library/Caches/*
  progress_bar 3
}

# Function to clean system cache
clean_system_cache() {
  echo "Cleaning system cache (requires sudo)..."
  sudo rm -rf /Library/Caches/* /System/Library/Caches/*
  progress_bar 3
}

# Function to remove temporary files
clean_temp_files() {
  echo "Cleaning temporary files..."
  sudo rm -rf /private/var/tmp/*
  sudo rm -rf /private/var/folders/*
  progress_bar 3
}

# Function to free up inactive memory (RAM)
free_ram() {
  echo "Freeing up RAM..."
  sudo purge
  progress_bar 2
}

# Summary of actions performed
summary() {
  echo -e "\n============================="
  echo -e "      Cleanup Summary"
  echo -e "============================="
  echo -e "✔ User Cache Cleared"
  echo -e "✔ System Cache Cleared"
  echo -e "✔ Temporary Files Removed"
  echo -e "✔ RAM Freed"
  echo -e "\nVisit: https://aakashrahsi.online/"
}

# Main Script Execution
echo -e "\nStarting Junk Cleaner for macOS..."
clean_user_cache
clean_system_cache
clean_temp_files
free_ram
summary

echo -e "\nCleanup completed successfully!"
