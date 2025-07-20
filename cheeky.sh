#!/bin/bash
#
#Script name: cheeky.sh
#
#Description: This bot commits to GitHub once a day if the computer is on.
#
#Author: Sara Leite - saraleite.mail@gmail.com
#
#Date: 2025-07-20
#
#Version: 1.0
#
#Usage: Tested on Linux Mint and that's it ngl. This is for personal use.

#1. We send a new line of text with the date and time to records.txt.
echo "Commit date: $(date)" >> records.txt

#2. Comandos de git para hacer el commit.
git add records.txt
git commit -m "Cheeky is in action! Commited on $(date)."
git push
