
function fish_greeting

end

if status is-interactive
	# Commands to run in interactive sessions can go here
end

function attach_tmux_session_if_needed
    set ID (tmux list-sessions 2>/dev/null)
    if test -z "$ID"
		tmux new-session -s 0 
		#tmux new-session -s 0 "banner.sh;fish"
		return
    end

    #set new_session "Create New Session"
    #set ID (echo $ID\n$new_session | peco --on-cancel=error | cut -d: -f1)
    #if test "$ID" = "$new_session"
    #    tmux new-session
    #else if test -n "$ID"
    tmux attach-session -t 0
	#tmux attach-session -t default
    #end
end

if test -z $TMUX && status --is-login
    attach_tmux_session_if_needed
end

#

function fish_prompt

	set -l last_status $status
	set -l result (~/bin/vpnbash.sh)

	
	#echo (set_color green)"┌──"(set_color green)"  "(set_color green)"("(set_color blue)"fl0wl3sS"(set_color green)")"$result"─["(set_color purple)(prompt_pwd)(set_color green)"]"(set_color cyan)"ඞ"(set_color yellow)"ඞ"(set_color red)"ඞ"
	echo -n (set_color green)"┌──"(set_color green)"﹝"(set_color blue)$USER(set_color green)"﹞"$result"─["(set_color purple)(prompt_pwd)(set_color green)"]"


	if test $last_status -eq 0
		echo (set_color cyan)"ඞ..."(set_color normal)
	else if test $last_status -eq 1
		echo (set_color yellow)"ඞ..."(set_color normal)
	else
			#echo -n (set_color red)"ඞ.."(set_color normal)
		echo (set_color red)"𓇋ඞ..."(set_color normal)
	end

	
	echo (set_color green)"└─"(set_color blue)"\$ "(set_color normal)
end





## alias
# HackTheBox
alias htb='cd ~/HTB/Box'
alias htb.vpn='cd ~/HTB/vpn'
alias htb.pwn='cd ~/HTB/challenges/pwn'
alias htb.rev='cd ~/HTB/challenges/rev'
alias htb.crypt='cd ~/HTB/challenges/crypt'
alias htb.gamepwn='cd ~/HTB/challenges/gamepwn'

alias htb.kill='sudo killall openvpn'
alias htb.server='cd ~/HTB/tools;python -m http.server '

# TryHackMe
alias thm.vpn='cd ~/THM/vpn'

# shortcut
alias learn='cd ~/CTF/learn' 
alias nightmare='cd ~/CTF/pwn/nightmare/modules'
alias gtfobins='cd /home/fl0wl3ss/Github/GTFOBins.github.io;bundle exec jekyll serve; cd'

# short commands
alias rc='rustc'
alias l='ls -a'

# replace commands
alias gdb='gdb -q'
alias ocat='/usr/bin/cat'
alias cat='ccat'
alias python='ipython3'

# connect pwncollege
alias dojo='ssh hacker@dojo.pwn.college'
alias symposium='cd ~/Github/symposium;cp /mnt/c/Users/4ro3ki/Desktop/symposium/* ~/Github/symposium/;git add symposium2022_preceeding_template.docx; sudo git commit -m "alias";git push origin master'


