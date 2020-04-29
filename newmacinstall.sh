#!/usr/bin/env bash

#copy myconfigs
cd ~
cp -r ~/newmac/myconfigs/.bash_profile ~/.bash_profile
cp -r ~/newmac/myconfigs/sshconfig ~/.ssh/config

#Install xcode
xcode-select -install

#Moving to home directory at the beginning of the process
cd ~ 
#Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew=(
    ffmpeg
    git
    htop
    mas
    tmux
    wget
    mc
    mtr
    azure-cli
    m-cli
    terraform
    ansible
    kubernetes-cli
)

cask=(
    bitbar
    keka
    spotify
    switchresx
    typora
    github
    visual-studio-code
    scroll-reverser
    aware
    macs-fan-control
    powershell
    vagrant
)

mas=(
    409203825 #Numbers 
    568494494 #Pocket
    803453959 #Slack
    1176895641 #Spark
    1147396723 #WhatsApp
    1295203466 #MS RDP
    823766827 #Onedrive
    #1438841416 #renameX
)

vscode=(
    vscoss.vscode-ansible
    ms-vscode.azure-account
    ms-azuretools.vscode-azureterraform
    mauve.terraform
    ms-azuretools.vscode-docker
    ms-vscode.powershell
    formulahendry.docker-explorer
    mhutchie.git-graph
    ms-azuretools.vscode-azurevirtualmachines
    ms-vscode.vscode-node-azure-pack
    bbenoist.vagrant
)

brew update
brew upgrade

#Homebrew App Installer
brew install ${brew[@]} 
#Casks Installer
brew cask install --appdir="/Applications" ${cask[@]} 
#Mac App Store Installer
mas install ${mas[@]} 
#install VS Code extensions
code --extensions-dir ~/.vscode/extensions
code --install-extension ${vscode[@]}

# Add Visual Studio Code (code) to bash.profile
# cat << EOF >> ~/.bash_profile
# export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
# EOF

#copy myconfigs
cd ~
# git clone myconfigs
cp -r ~/newmac/myconfigs/.tmux.conf ~/.tmux.conf
cp -r ~/newmac/myconfigs/htoprc ~/.config/htop/htoprc

# write defaults
defaults write com.apple.TextEdit RichText -int 0 #Sets Texedit to Automatically Open in Plain Text
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true #Closes Print Dialog Box After Printing is Complete
defaults write com.apple.NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool FALSE #Remove Save to iCloud Functionality
defaults write com.apple.dock tilesize -int 48 #Setting Icon Size to 48 Pixels
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true #Removes External Drives on Desktop
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true #Removes Internal Drives on Desktop
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true #Removes Mounted Servers on Desktop
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true #Removes Removable Media on Desktop
defaults write com.apple.finder FXEnableRemoveFromICloudDriveWarning -bool false #Stop the automatic save to iCloud thing
defaults write com.apple.NSGlobalDomain NSWindowResizeTime -float 0.001 
defaults write com.apple.NSGlobalDomain NSAutomaticCapitalizationEnabled -bool NO #Disabling Automatic Capitalization

rm -rf ~/mlconfig/macconfig
#end
