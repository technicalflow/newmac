#!/usr/bin/env bash

#copy myconfigs
cd ~
cat << EOFbash > ~/.bash_profile
HISTSIZE=2000
HISTFILESIZE=2000

export EDITOR='nano'
export PATH="$PATH:/usr/local/bin/"
export PATH="/usr/local/git/bin:/sw/bin/:/usr/local/bin:/usr/local/:/usr/local/sbin:/usr/local/mysql/bin:$PATH"
export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

alias myip='curl icanhazip.com' # myip: Public facing IP Address
alias netcons='lsof -i' # netCons: Show all open TCP/IP sockets
alias flushdns='dscacheutil -flushcache' # flushDNS: Flush out the DNS Cache
alias lsock='sudo /usr/sbin/lsof -i -P' # lsock: Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP' # lsockU: Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP' # lsockT: Display only open TCP sockets
alias ipinfo0='ipconfig getpacket en0' # ipInfo0: Get info on connections for en0
alias ipinfo1='ipconfig getpacket en1' # ipInfo1: Get info on connections for en1
alias openports='sudo lsof -i | grep LISTEN' # openPorts: All listening connections
alias showblocked='sudo ipfw list' # showBlocked: All ipfw rules inc/ blocked IPs
alias memHogstop='top -l 1 -o rsize | head -20'
alias memHogsps='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'
alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'
alias topforever='top -l 9999999 -s 10 -o cpu'
alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias clonevagrant='git clone https://github.com/technicalflow/vagrant.git'
alias ll='ls -la'
alias wttr='curl wttr.in' #Check the weather in your region from commandline
alias vpnc='networksetup -connectpppoeservice "Office"'
alias vpnd='networksetup -disconnectpppoeservice "Office"'
alias ipc='ifconfig | grep -w inet'
alias ns="wget --output-document=/dev/null http://speedtest.wdc01.softlayer.com/downloads/test100.zip"
alias tt="tmux a"
alias tn="tmux new -s base"
alias ttn="tmux attach -t base || tmux new -s base"
alias txt='open -a /System/Applications/TextEdit.app/'

# Disable Spotlight
alias spotoff="sudo mdutil -a -i off"
# Enable Spotlight
alias spoton="sudo mdutil -a -i on"

alias backup="curl -s https://raw.githubusercontent.com/restic/others/master/README.md | grep encrypted | grep incremental | grep dedup"

#NEW
# shopt -s cdspell
# complete -d cd
EOFbash

cat << EOFssh > ~/.ssh/config
# SSH config
Host hostname
	Hostname hostname.com
	User user
	Port port number
EOFssh

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
    gotop
    azure-cli
    m-cli
    terraform
    ansible
    kubernetes-cli
)

cask=(
    #bitbar
    #keka
    spotify
    #switchresx
    #typora
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

cat << EOFtmux > ~/.tmux.conf
unbind %
bind | split-window -h
bind - split-window -v

set -g prefix C-a
unbind C-b
bind C-a send-prefix

# new-session -n $HOST

# set -g mouse on
# set -s escape-time 0

set -g status-interval 60

WEATHER='#(curl -s wttr.in/Poznan?format\="%%l:+%%c%%20%%t%%60%&period=60")'
BATTERY='#(pmset -g batt | cut -c 33-65)'

# setw -g clock-mode-colour yellow

# Set status bar
set -g status-bg colour18
set -g status-fg white

set -g status-justify left
set -g status-right-length 60
set -g status-left-length 50

set -g status-right "$WEATHER | $BATTERY"
set -g status-left  "#[fg=yellow] %H:%M | %d/%m | #[fg=green]#H "

set -g terminal-overrides xterm*:smcup@:rmcup@

# set -g status-left '$WEATHER | %H:%M'
# set -g status-right '#[fg=colour233,bg=colour19] %d/%m #[fg=colour233,bg=colour8] %H:%M:%S '

# setw -g window-status-bell-style 'fg=colour255 bg=colour1 bold'

EOFtmux

cat << EOFhtop > ~/.config/htop/htoprc
# Beware! This file is rewritten by htop when settings are changed in the interface.
# The parser is also very primitive, and not human-friendly.
fields=0 48 17 18 38 39 2 46 47 49 1
sort_key=46
sort_direction=1
hide_threads=0
hide_kernel_threads=1
hide_userland_threads=0
shadow_other_users=0
show_thread_names=0
show_program_path=1
highlight_base_name=0
highlight_megabytes=1
highlight_threads=1
tree_view=0
header_margin=1
detailed_cpu_time=0
cpu_count_from_zero=0
update_process_names=0
account_guest_in_cpu_meter=0
color_scheme=0
delay=15
left_meters=LeftCPUs Memory Swap
left_meter_modes=1 1 1
right_meters=RightCPUs Tasks LoadAverage Uptime
right_meter_modes=1 2 2 2
EOFhtop

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
defaults write com.apple.finder ShowPathbar -bool true #Adds the path bar to the bottom of the finder
# defaults write com.apple.finder DisableAllAnimations -bool true #Disable Finder Animations


killall dock
killall Finder

# rm -rf ~/newmacinstall.sh
#end
