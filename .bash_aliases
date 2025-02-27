# -*- mode: fish; lexical-binding: t -*-
### ALIASES ###
#list
alias ls='eza --color=always'
alias lg='eza -lG'
alias lag='eza -lAG'
alias la='eza -A --color=auto'
#alias ll='eza -AlFh --icons'
alias ll='eza -AlFG --icons'
#alias l='eza -lA'
alias l='eza -lAG --icons --color=always'
alias l.="ls -A | egrep '^\.'"

#fix obvious typo's
alias cd..='cd ..'
alias pdw='pwd'
alias udpate='sudo pacman -Syu'
alias upate='sudo pacman -Syu'
alias updte='sudo pacman -Syu'
alias updqte='sudo pacman -Syu'
alias upqll='paru -Syu --noconfirm'
alias upal='paru -Syu --noconfirm'

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

#readable output
alias df='df -h'

#keyboard
alias give-me-azerty-be="sudo localectl set-x11-keymap be"
alias give-me-qwerty-us="sudo localectl set-x11-keymap us"

#setlocale
alias setlocale="sudo localectl set-locale LANG=en_US.UTF-8"
alias setlocales="sudo localectl set-x11-keymap be && sudo localectl set-locale LANG=en_US.UTF-8"

# dualboot timing fix
alias timedatefix = "timedatectl set-local-rtc 1 --adjust-system-clock"

#pacman unlock
alias unlock="sudo rm /var/lib/pacman/db.lck"
alias rmpacmanlock="sudo rm /var/lib/pacman/db.lck"
alias fixpacman = "sudo rm /var/lib/pacman/db.lck"

#free
alias free="free -mt"

#continue download
alias wget="wget -c --hsts-file=\"$XDG_DATA_HOME/wget-hsts\""

#userlist
alias userlist="cut -d: -f1 /etc/passwd | sort"

#merge new settings
alias merge="xrdb -merge ~/.Xresources"

# Aliases for software managment
# pacman
# alias pacman="sudo pacman --color auto"
alias update="sudo pacman -Syu --disable-download-timeout"

# paru as aur helper - updates everything
# alias pksyua="paru -Syu --noconfirm" # Uncomment this if you want to install paru
alias upall="yay -Syu --noconfirm"

#ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"

#grub update
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
#grub issue 08/2022
alias install-grub-efi="sudo grub-install --target=x86_64-efi --efi-directory=/boot/efi"

# add new fonts
alias update-fc='sudo fc-cache -fv'

#copy/paste all content of /etc/skel over to home folder - backup of config created - beware
#skel alias has been replaced with a script at /usr/local/bin/skel

#backup contents of /etc/skel to hidden backup folder in home/user
alias bupskel='cp -Rf /etc/skel ~/.skel-backup-$(date +%Y.%m.%d-%H.%M.%S)'

#copy shell configs
# alias cb='cp /etc/skel/.bashrc ~/.bashrc && echo "Copied."'
alias cz='cp /etc/skel/.zshrc ~/.zshrc && exec zsh'
alias cf='cp /etc/skel/.config/fish/config.fish ~/.config/fish/config.fish && echo "Copied."'

#switch between bash and zsh
alias switchtobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias switchtozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias switchtofish="sudo chsh $USER -s /bin/fish && echo 'Now log out.'"

#switch between lightdm and sddm
alias switchtolightdm="sudo pacman -S lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings --noconfirm --needed ; sudo systemctl enable lightdm.service -f ; echo 'Lightm is active - reboot now'"
alias switchtosddm="sudo pacman -S sddm --noconfirm --needed ; sudo systemctl enable sddm.service -f ; echo 'Sddm is active - reboot now'"
alias switchtoly="sudo pacman -S ly --noconfirm --needed ; sudo systemctl enable ly.service -f ; echo 'Ly is active - reboot now'"
alias switchtogdm="sudo pacman -S gdm --noconfirm --needed ; sudo systemctl enable gdm.service -f ; echo 'Gdm is active - reboot now'"
alias switchtolxdm="sudo pacman -S lxdm --noconfirm --needed ; sudo systemctl enable lxdm.service -f ; echo 'Lxdm is active - reboot now'"

# kill commands
# quickly kill conkies
alias kc='killall conky'
# quickly kill polybar
alias kp='killall polybar'
# quickly kill picom
alias kpi='killall picom'
# reload waybar after config change
alias reloadwaybar="pkill -USR2 waybar"

#hardware info --short
alias hw="hwinfo --short"

#audio check pulseaudio or pipewire
alias audio="pactl info | grep 'Server Name'"

#skip integrity check
alias yayskip='yay -S --mflags --skipinteg'

#check vulnerabilities microcode
alias microcode='grep . /sys/devices/system/cpu/vulnerabilities/*'

#get fastest mirrors in your neighborhood
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 30 --number 10 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 30 --number 10 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 30 --number 10 --sort age --save /etc/pacman.d/mirrorlist"
#our experimental - best option for the moment
alias mirrorx="sudo reflector --age 6 --latest 20  --fastest 20 --threads 5 --sort rate --protocol https --save /etc/pacman.d/mirrorlist"
alias mirrorxx="sudo reflector --age 6 --latest 20  --fastest 20 --threads 20 --sort rate --protocol https --save /etc/pacman.d/mirrorlist"
alias ram='rate-mirrors --allow-root --disable-comments arch | sudo tee /etc/pacman.d/mirrorlist'
alias rams='rate-mirrors --allow-root --disable-comments --protocol https arch  | sudo tee /etc/pacman.d/mirrorlist'

#shopt
#shopt -s autocd # change to named directory
#shopt -s cdspell # autocorrects cd misspellings
#shopt -s cmdhist # save multi-line commands in history as single line
#shopt -s dotglob
#shopt -s histappend # do not overwrite history
#shopt -s expand_aliases # expand aliases

#youtube download (Uncomment after installing yt-dlp)
# alias yta-aac="yt-dlp --extract-audio --audio-format aac "
# alias yta-best="yt-dlp --extract-audio --audio-format best "
# alias yta-flac="yt-dlp --extract-audio --audio-format flac "
# alias yta-mp3="yt-dlp --extract-audio --audio-format mp3 "
# alias ytv-best="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 "

#Recent Installed Packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias riplong="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"

#Cleanup orphaned packages
# alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'
alias cleanup='sudo pacman -Rcns `pacman -Qqd | pacman -Rsu --print -`'
# alias cleanup='sudo pacman -Rns $(pacman -Qtdq) &>/dev/null'

#clear
alias clean="clear; seq 1 $(tput cols) | sort -R | sparklines | lolcat"

#search content with ripgrep
alias rg="rg -i --sort path"

#get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

#nano for important configuration files
#know what you do in these files
alias nlxdm="sudo $EDITOR /etc/lxdm/lxdm.conf"
alias nlightdm="sudo $EDITOR /etc/lightdm/lightdm.conf"
alias npacman="sudo $EDITOR /etc/pacman.conf"
alias ngrub="sudo $EDITOR /etc/default/grub"
alias nconfgrub="sudo $EDITOR /boot/grub/grub.cfg"
alias nmkinitcpio="sudo $EDITOR /etc/mkinitcpio.conf"
alias nmirrorlist="sudo $EDITOR /etc/pacman.d/mirrorlist"
alias narcomirrorlist="sudo $EDITOR /etc/pacman.d/arcolinux-mirrorlist"
alias nsddm="sudo $EDITOR /etc/sddm.conf"
alias nsddmk="sudo $EDITOR /etc/sddm.conf.d/kde_settings.conf"
alias nfstab="sudo $EDITOR /etc/fstab"
alias nnsswitch="sudo $EDITOR /etc/nsswitch.conf"
alias nsamba="sudo $EDITOR /etc/samba/smb.conf"
alias ngnupgconf="sudo $EDITOR /etc/pacman.d/gnupg/gpg.conf"
alias nhosts="sudo $EDITOR /etc/hosts"
alias nhostname="sudo $EDITOR /etc/hostname"
alias nb="$EDITOR ~/.bashrc"
alias nz="$EDITOR ~/.zshrc"
alias nf="$EDITOR ~/.config/fish/config.fish"
alias nneofetch="$EDITOR ~/.config/neofetch/config.conf"

#reading logs with bat
alias lcalamares="bat /var/log/Calamares.log"
alias lpacman="bat /var/log/pacman.log"
alias lxorg="bat /var/log/Xorg.0.log"
alias lxorgo="bat /var/log/Xorg.0.log.old"

#gpg
#verify signature for isos
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
alias fix-gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
#receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"
alias fix-gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"
alias fix-keyserver="[ -d ~/.gnupg ] || mkdir ~/.gnupg ; cp /etc/pacman.d/gnupg/gpg.conf ~/.gnupg/ ; echo 'done'"

#fixes
# alias fix-permissions="sudo chown -R $USER:$USER ~/.dotfiles/ ~/.local"

#maintenance
alias big="expac -H M '%m\t%n' | sort -h | nl"

#hblock (stop tracking with hblock)
#use unhblock to stop using hblock
alias unhblock="hblock -S none -D none"

#systeminfo
alias probe="sudo -E hw-probe -all -upload"
alias sysfailed="systemctl list-units --failed"

#shutdown or reboot
alias ssn="sudo shutdown now"
alias sr="sudo reboot"

#update betterlockscreen images
# alias bls="betterlockscreen -u /usr/share/backgrounds/arcolinux/"

#give the list of all installed desktops - xsessions desktops
alias xd="ls /usr/share/xsessions"

#remove
alias rmgitcache="rm -r ~/.cache/git"



alias ascii="awk 'BEGIN {for (i = 33; i < 129; i++) printf \"%3d 0x%02x %c\n\", i, i, i}'  | nbat"
alias mdp="mkdir -p"
alias xhost-thing="xhost +si:localuser:$USER"
alias chm="chmod +x"
alias killall="pkill" # for some reason kilalll doesn't work on nixos
alias sys=systemctl
alias sysu="systemctl --user"
alias syu="systemctl --user"
alias sy="systemctl --user"
alias httpie="http" # virtualenv doesn't work with python 3.11, using the binary for now
alias https="http"
# alias dw="dw -c --done \"󱘹\" --left \"󱘹\" --current \"\" --color-done \"green\" --color-left \"blue\" --color-current \"yellow\" --icon-border \"| |\" "
alias dw="dw -c --done \"󱘹\" --left \"󱘹\" --current \"\" --color-done \"red\" --color-left \"blue\" --color-current \"yellow\" --icon-border \" \" "
alias explicit-packages="paru -Qent"
alias octave="octave -H -q" # no command history, no startup messages
alias dust="dust -r" # dust is in dotfiles/scripts
alias bat="bat --plain --number --color=always" 
alias ncbat="bat --plain --color never"
alias notif-daemon="busctl --user list | grep org.freedesktop.Notifications"
alias nbat="bat --plain --color=always" # don't show line numbers
alias batn="bat --plain --color=always" # don't show line numbers
alias grh="git reset --hard"
alias gd="git diff"
alias gp='git push origin $(git branch | awk "{printf \$2} ")'
# alias nf="neofetch --ascii_distro Archlinux"
alias nf=neofetch
alias eho="echo"
alias eco="echo"
alias cdot="cd $HOME/.dotfiles"
alias cd-="cd -"
alias dot="cd ~/.dotfiles"
alias am="appman" # from dotfiles/scripts
alias lsblk="lsblk -o name,mountpoint,label,size"
alias star=starship
alias sww="swww"
alias swwww="swww"
#alias nvim=lvim
alias compile-run="compile" # from dotfiles/scripts
alias c="cd"
alias wh="which"
alias killalll=killall # embarassing typo
alias ka="killall"
alias gcc="gcc -g"
alias ggcc="gcc -g"
alias gccg="gcc -g"
# alias edit-linker="nvim ~/.dotfiles/scripts/linker"
alias pr=procs
alias ki="kitten icat" # WezTerm imgcat doesnt work on XWayland
alias s=sudo
alias gdb="gdb -q"
# alias flatpak="flatpak --user" # add flathub as a user repo only, NOT the system repo.. this will do
alias ke="killall emacs"
alias ga.="git add . "
alias gaa="git add . "
alias gro="git remote get-url origin "
alias gso="git remote set-url origin "
alias rrm="rm -rf"
alias rmr="rm -rf"
alias paru="yay --answerdiff None --answerclean None --removemake --sudoloop"
alias pacman-checkmissing="pacman -Qk 2>/dev/null | rg -e \"[^0] missing files\""
alias yay="yay --sudoloop"
alias rmrf="sudo rm -rf"
alias chup="pacman -Qu" # checkupdates
alias cu="checkupdates"
alias tou=touch
# alias zshc="emc $HOME/.dotfiles/shells/zsh/zshrc"
# alias zshc="nvim $HOME/.dotfiles/shells/zsh/zshrc"
alias config="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
alias show-bgs="feh -d ~/.dotfiles/wallpapers" # or the ~/.wallpapers symlink
# alias what="file $@"
# alias search="sudo find / -iname $@" # or `"sudo fd / --glob -H $@"`
# alias open="detach xdg-open"
alias fbg="feh --bg-fill"
#alias fd="sudo fd --glob"
alias ptp=ptpython
alias ptip=ptipython
alias pti=ptipython
alias venv="python -m venv"
alias hde="hyprctl dispatch exit"
alias gres="git restore"
alias gcl="git clone --depth 1" 
# alias nativefier-custom = "cd ~/Nativefier && nativefier "$1" --disable-dev-tools --single-instance --tray --disable-gpu"
alias gs="git status"
alias ska="sudo killall"
alias faillock="faillock --user $USER --reset"
alias du="du -d 2 -h ./ 2>/dev/null"
alias start="systemctl start"
alias stop="systemctl stop"
alias restart="systemctl restart"
alias startu="systemctl --user start"
alias stopu="systemctl --user stop"
alias restartu="systemctl --user restart"
alias start-sshd="sudo systemctl start sshd"
alias stop-sshd="sudo systemctl stop sshd &> /dev/null"
alias restart-sshd="stop-libvirtd && start-libvirtd"
# alias cd-blog="cd ~/Git/blog/zstgblog/"
# alias get-ip="echo -e 'Public: $(curl ifconfig.me 2>/dev/null)\nPrivate: $(ip a | grep -E 'inet 192\.168\.0\.[0-9]+' | awk '{print $2}' | cut -d/ -f1)'"

alias ai="appimage-run"
alias ai-run="appimage-run"
# alias gcc="clang"
# alias g++="clang++"



