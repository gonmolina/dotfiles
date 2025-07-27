starship init fish | source

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba shell init' !!
set -gx MAMBA_EXE "/home/gonzalo/miniforge3/bin/mamba"
set -gx MAMBA_ROOT_PREFIX "/home/gonzalo/miniforge3"
$MAMBA_EXE shell hook --shell fish --root-prefix $MAMBA_ROOT_PREFIX | source
# <<< mamba initialize <<<

# set default editor
set -gx EDITOR "/usr/bin/nvim"

# alises
alias ls='eza'
alias l='eza -l'
