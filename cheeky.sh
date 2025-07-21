#!/bin/bash
#
#Script name: cheeky.sh
#
#Description: This script adds a new line to a txt and commits to a repository on GitHub.
#
#Author: Sara Leite - saraleite.mail@gmail.com
#
#Date: 2025-07-20
#
#Version: 1.0
#

# Exit if any command fails
set -e

# Navigate to the script's directory
cd "$(dirname "$(readlink -f "$0")")"

#1. Send a new line of text with the date and time to records.txt.
echo "Commit date: $(date)" >> records.txt

#2. Git commands to make the commit.
git add records.txt
git commit -m "Cheeky is in action! Totally legit commit on $(date)."
git push