for config_file ($HOME/.zsh/*.zsh); do
  source $config_file
done

# load (auto) up chruby
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

PS1='
%F{135}%n%f@%F{166}%m%f:%F{118}%~%f${vcs_info_msg_0_}
$ '

function history-search-end {
    integer ocursor=$CURSOR

    if [[ $LASTWIDGET = history-beginning-search-*-end ]]; then
      # Last widget called set $hbs_pos.
      CURSOR=$hbs_pos
    else
      hbs_pos=$CURSOR
    fi

    if zle .${WIDGET%-end}; then
      # success, go to end of line
      zle .end-of-line
    else
      # failure, restore position
      CURSOR=$ocursor
      return 1
    fi
}
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

alias be='bundle exec'
