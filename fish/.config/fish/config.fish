starship init fish | source

# set default editor
set -gx EDITOR "/usr/bin/nvim"

# alises eza (ls clone)
alias ls='eza'
alias l='eza -l'

# aliases work
alias cneaproj="cd $HOME/dev/CNEAProjects"
alias gIOproj="cd $HOME/dev/CNEAProjects/globalIOProj/"
alias conRA10plcio="ssh -Y -p 2222 root@ra10plcio.ctrad.control"

#alias neovim
alias obsi="cd /home/gonza/vaults/notes/ && nvim ."

# config fast node manager fnm
fnm completions --shell fish | source
fnm env --use-on-cd --shell fish | source

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/gonza/miniforge3/bin/conda
    eval /home/gonza/miniforge3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/gonza/miniforge3/etc/fish/conf.d/conda.fish"
        . "/home/gonza/miniforge3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/gonza/miniforge3/bin" $PATH
    end
end
# <<< conda initialize <<<
zoxide init fish | source

