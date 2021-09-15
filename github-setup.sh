#!/bin/sh

if [ $# -lt 2 ];
	then
	echo "Too few arguments! Please specify username and e-mail in this format: ./github-setup.sh <username> <email>"
elif [ $# -gt 2 ];
	then
	echo "Too many arguments! Please specify username and e-mail in this format: ./github-setup.sh <username> <email>"
else
echo "GitHub Setup Script v0.0.1"
echo "Make sure git, and ssh are installed, and make sure you have an ssh agent running!"

echo ""
echo "Setting git username to $1 and e-mail to $2"
git config --global user.name "$1"
git config --global user.email "$2"

echo ""
echo "Generating SSH key, please hit enter to accept defaults, then enter a password when asked."
ssh-keygen -t ed25519 -C "$2"

echo ""
echo "Adding SSH key to the SSH Agent"
ssh-add ~/.ssh/id_ed25519

echo ""
echo "Displaying the SSH public key. Copy-paste this into GitHub settings."
echo ""
cat ~/.ssh/id_ed25519.pub

echo ""
echo "Script completed!"
fi