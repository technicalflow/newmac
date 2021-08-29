#!/usr/bin/env bash

#copy myconfigs
cd ~
cat << EOFbash > ~/.bash_profile
HISTSIZE=2000
HISTFILESIZE=2000

export EDITOR='nano'
export PATH="$PATH:/usr/local/bin/"
export PATH="/usr/local/git/bin:/sw/bin/:/usr/local/bin:/usr/local/:/usr/local/sbin:/usr/local/mysql/bin:$PATH"

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
alias ll='ls -la'
alias wttr='curl wttr.in' #Check the weather in your region from commandline
alias vpnc='networksetup -connectpppoeservice "Office"'
alias vpnd='networksetup -disconnectpppoeservice "Office"'
alias ipc='ifconfig | grep -w inet'
alias ns="wget --output-document=/dev/null http://speedtest.wdc01.softlayer.com/downloads/test100.zip"
alias tt="tmux a"
alias tn="tmux new -s base"
alias ttn="tmux attach -t base || tmux new -s base"

# Disable Spotlight
alias spotoff="sudo mdutil -a -i off"
# Enable Spotlight
alias spoton="sudo mdutil -a -i on"

EOFbash

mkdir -p ~/.ssh
touch ~/.ssh/config
cat << EOFssh > ~/.ssh/config
# SSH config
Host
  Hostname
  User
  Port
EOFssh

#Install xcode
xcode-select --install

#Moving to home directory at the beginning of the process
cd ~ 
#Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew=(
#    ffmpeg
    git
    gh
    htop
    mas
    tmux
    wget
    mc
    mtr
    gotop
    iperf
    azure-cli
    m-cli
    terraform
    ansible
    youtube-dl
    hugo
#    kubernetes-cli
)

cask=(
    #bitbar
    #keka
    spotify
    typora
    github
    visual-studio-code
    #scroll-reverser
    macs-fan-control
    powershell
    #virtualbox
    #vagrant
)

mas=(
    409203825 #Numbers
    1082170746 #Aware  
    568494494 #Pocket
    803453959 #Slack
    1176895641 #Spark
    1147396723 #WhatsApp
    1295203466 #MS RDP
    823766827 #Onedrive
)

vscode=(
    vscoss.vscode-ansible
    ms-vscode.azure-account
    ms-azuretools.vscode-azureterraform
#    mauve.terraform
    ms-azuretools.vscode-docker
    ms-vscode.powershell
    ms-azuretools.vscode-azurevirtualmachines
    ms-vscode.vscode-node-azure-pack
)

brew update
brew upgrade

#Homebrew App Installer
brew install ${brew[@]} 
#Casks Installer
brew install --appdir="/Applications" ${cask[@]} 
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

touch ~/.ltmux.conf
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
set -g default-terminal "screen-256color"

setw -g clock-mode-colour white

# Set status bar
set -g status-bg colour8
set -g status-fg white

set -g status-justify left
set -g status-right-length 80
set -g status-left-length 60

set -g status-right "#[fg=yellow]%H:%M | %d/%m"
set -g status-left  "#[fg=green]#H "

set -g terminal-overrides xterm*:smcup@:rmcup@

# set -g status-left '$WEATHER | %H:%M'
# set -g status-right '#[fg=colour233,bg=colour19] %d/%m #[fg=colour233,bg=colour8] %H:%M:%S '

# setw -g window-status-bell-style 'fg=colour255 bg=colour1 bold'

EOFtmux

mkdir -p ~/.config/htop
touch ~/.config/htop/htoprc
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
delay=20
left_meters=LeftCPUs Memory Swap
left_meter_modes=1 1 1
right_meters=RightCPUs Tasks LoadAverage Uptime
right_meter_modes=1 2 2 2
EOFhtop

# Turn Off Spotlights in this locations
alias spotoffonedrive='sudo mdutil -i off ~/OneDrive'

# write defaults
defaults write com.apple.TextEdit RichText -int 0 #Sets Texedit to Automatically Open in Plain Text
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true #Closes Print Dialog Box After Printing is Complete
defaults write com.apple.NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool FALSE #Remove Save to iCloud Functionality
defaults write com.apple.dock tilesize -int 48 #Setting Icon Size to 48 Pixels
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true #External Drives on Desktop
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true #Internal Drives on Desktop
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true #Mounted Servers on Desktop
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true #Removable Media on Desktop
defaults write com.apple.finder FXEnableRemoveFromICloudDriveWarning -bool false #Stop the automatic save to iCloud thing
defaults write com.apple.NSGlobalDomain NSWindowResizeTime -float 0.001 
defaults write com.apple.NSGlobalDomain NSAutomaticCapitalizationEnabled -bool NO #Disabling Automatic Capitalization
defaults write com.apple.finder ShowPathbar -bool true #Adds the path bar to the bottom of the finder
# defaults write com.apple.finder DisableAllAnimations -bool true #Disable Finder Animations
defaults write com.apple.dock springboard-rows -int 5
defaults write com.apple.dock springboard-columns -int 9

killall Dock
killall Finder

# rm -rf ~/newmacinstall.sh
#end
