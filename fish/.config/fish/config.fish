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

zoxide init fish | source


# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba shell init' !!
set -gx MAMBA_EXE "/home/gonza/miniforge3/bin/mamba"
set -gx MAMBA_ROOT_PREFIX "/home/gonza/miniforge3"
$MAMBA_EXE shell hook --shell fish --root-prefix $MAMBA_ROOT_PREFIX | source
# <<< mamba initialize <<<
