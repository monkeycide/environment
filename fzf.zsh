# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/monkeycide/.fzf/bin* ]]; then
  export PATH="$PATH:/Users/monkeycide/.fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" == */Users/monkeycide/.fzf/man* && -d "/Users/monkeycide/.fzf/man" ]]; then
  export MANPATH="$MANPATH:/Users/monkeycide/.fzf/man"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/monkeycide/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/monkeycide/.fzf/shell/key-bindings.zsh"

