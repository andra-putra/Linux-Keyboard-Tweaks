#!/bin/bash
echo "Note: PLEASE RUN THIS SCRIPT FROM INSIDE .dotfiles FOLDER"
# Backup current Xmodmap file
if [ -f ~/.Xmodmap ]; then
	cp ~/.Xmodmap ~/.Xmodmap.bak
	echo "Created backup of current .Xmodmap file as ~/.Xmodmap.bak"
fi

# Copies .Xmodmap file from repo to home directory
cp ./.Xmodmap ~/.Xmodmap
echo "Successfully copied modified .Xmodmap file from repo to home directory"

# Adds xmodmap command to startup apps using .desktop file

mkdir -p ~/.config/autostart

cat > ~/.config/autostart/xmodma.desktop << EOF
[Desktop Entry]
Type=Application
Exec=/usr/bin/xmodmap /home/$(whoami)/.Xmodmap
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name[en_US]=Load Xmodmap
Name=Load Xmodmap
Comment=Loads the custom .Xmodmap file on startup
EOF

echo "Xmodmap command successfully added to startup applications"

echo "Please restart your computer for the changes to take effect"


