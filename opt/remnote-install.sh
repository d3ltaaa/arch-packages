#!/bin/bash

# set up the folders
mkdir -p ~/Downloads
mkdir -p ~/opt/Remnote
mkdir -p /usr/share/applications


cd Downloads

# Download Remnote AppImage and rename it
curl -L -o Remnote.AppImage https://www.remnote.com/desktop/linux

# Download Remnote Icon

# Make the AppImage executable
chmod +x Remnote.AppImage

# Move the AppImage to /opt
sudo mv Remnote.AppImage /opt/Remnote

# Create a desktop file for the Remnote app
sudo tee /usr/share/applications/remnote.desktop > /dev/null <<EOF
[Desktop Entry]
Name=Remnote
Comment=Note-taking and spaced repetition software
Exec=/opt/Remnote.AppImage
Icon=remnote
Terminal=false
Type=Application
Categories=Utility;TextEditor;
EOF

# Make the desktop file executable
sudo chmod +x /usr/share/applications/remnote.desktop

# Update your application list
sudo update-desktop-database
