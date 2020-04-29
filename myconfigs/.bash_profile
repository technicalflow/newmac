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
alias gclone='git clone https://github.com/technicalflow/vagrant.git'
alias ll='ls -la'
alias wttr='curl wttr.in'
alias vpnc='networksetup -connectpppoeservice "VPN Biuro"'
alias vpnd='networksetup -disconnectpppoeservice "VPN Biuro"'
alias ipc='ifconfig | grep -w inet'
alias ns="wget --output-document=/dev/null http://speedtest.wdc01.softlayer.com/downloads/test100.zip"
alias tt="tmux a"
alias ttn="tmux attach -t base || tmux new -s base"
# Disable Spotlight
alias spotoff="sudo mdutil -a -i off"
# Enable Spotlight
alias spoton="sudo mdutil -a -i on"

alias backup="curl -s https://raw.githubusercontent.com/restic/others/master/README.md | grep encrypted | grep incremental | grep dedup"

#NEW
shopt -s cdspell
complete -d cd

