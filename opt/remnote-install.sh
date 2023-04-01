#!/bin/bash

# set up the folders
mkdir -p ~/Downloads
mkdir -p ~/opt/Remnote
mkdir -p /usr/share/applications


cd Downloads

# Download Remnote AppImage and rename it
curl -L -o remnote.AppImage https://www.remnote.com/desktop/linux

# Make the AppImage executable
chmod +x remnote.AppImage

# Move the AppImage to /opt
sudo mv remnote.AppImage /opt/Remnote

# Download Remnote icon and move it to /usr/share/icons/hicolor/512x512/apps
sudo wget -O /usr/share/icons/hicolor/512x512/apps/remnote.png https://raw.githubusercontent.com/d3ltaaa/arch-packages/main/opt/remnote-icon.png

# Create a desktop file for the Remnote app
sudo tee /usr/share/applications/remnote.desktop > /dev/null <<EOF
[Desktop Entry]
Name=Remnote
Comment=Note-taking and spaced repetition software
Exec=/opt/Remnote/remnote.AppImage
Icon=/usr/share/icons/hicolor/512x512/apps/remnote.png
Terminal=false
Type=Application
Categories=Education;
EOF

# Make the desktop file executable
sudo chmod +x /usr/share/applications/remnote.desktop

# Update your application list
sudo update-desktop-database

