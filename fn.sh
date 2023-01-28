full() {
  echo "Setting up Steam, Heroic as a EGL client, wine and Proton-GE through ProtonUp"
  clear
  echo "Setting up Steam"
  sudo tee /etc/apt/sources.list.d/steam.list <<'EOF'
deb [arch=amd64,i386] http://repo.steampowered.com/steam/ stable steam
deb-src [arch=amd64,i386] http://repo.steampowered.com/steam/ stable steam
EOF
sudo dpkg --add-architecture i386
sudo apt update
sudo apt install -y \
  libgl1-mesa-dri:amd64 \
  libgl1-mesa-dri:i386 \
  libgl1-mesa-glx:amd64 \
  libgl1-mesa-glx:i386 \
  steam-launcher
  clear
  echo "Setting up Heroic and Proton-GE"
  sudo apt install -y flatpak
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
  flatpak install flathub com.heroicgameslauncher.hgl flathub net.davidotek.pupgui2 -y
  clear
  echo "Setting up Wine"
  sudo mkdir -pm755 /etc/apt/keyrings
  sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
  sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources
  sudo apt install --install-recommends winehq-stable -y
  clear
  echo "All done!"
}
steam() {
 echo "Setting up Steam"
 sudo tee /etc/apt/sources.list.d/steam.list <<'EOF'                     
 deb [arch=amd64,i386] http://repo.steampowered.com/steam/ stable steam    
 deb-src [arch=amd64,i386] http://repo.steampowered.com/steam/ stable steam
EOF
  sudo dpkg --add-architecture i386
  sudo apt update
  sudo apt install -y \ 
   libgl1-mesa-dri:amd64 \
   libgl1-mesa-dri:i386 \ 
   libgl1-mesa-glx:amd64 \
   libgl1-mesa-glx:i386 \
   steam-launcher
  echo "All done!"
}
wineproton() {
  echo "Setting up Proton-GE"
  sudo apt install -y flatpak                                                                                                                                                                                                            
  flatpak remote-add --if-not-exists --system flathub https://flathub.org/repo/flathub.flatpakrepo                                                                                                                                       
  flatpak install flathub flathub net.davidotek.pupgui2 -y                                                                                                                                                                               
  clear                                                                                                                                                                                                                                  
  echo "Setting up Wine"                                                                                                                                                                                                                 
  sudo mkdir -pm755 /etc/apt/keyrings                                                                                                                                                                                                    
  sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key                                                                                                                                         
  sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/jammy/winehq-jammy.sources                                                                                                                       
  sudo apt install --install-recommends winehq-stable -y                                                                                                                                                                                 
  clear                                                                                                                                                                                                                                  
  echo "All done!"                                                                                                                                                                                                                       
}
export full
export steam
export wineproton