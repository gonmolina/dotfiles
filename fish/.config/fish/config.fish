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
alias obsi="cd $HOME/vaults/notes/ && nvim ."

# config fast node manager fnm
fnm completions --shell fish | source
fnm env --use-on-cd --shell fish | source

zoxide init fish | source

# setting proxy configuration
set -gx http_proxy "http://proxy.cnea.gob.ar:1280"
set -gx https_proxy "http://proxy.cnea.gob.ar:1280"
set -gx ftp_proxy "http://proxy.cnea.gob.ar:1280"
set -gx no_proxy "localhost, 127.0.0.1, ::1, *.cnea.gov.ar, *.cnea.gob.ar, *.local, www2.ib.edu.ar, *.ctrad.control, *.develsrv.ctrad.control, 10.73.32.{0..255}" 

set -gx HTTP_PROXY $http_proxy
set -gx HTTPS_PROXY $https_proxy
set -gx FTP_PROXY $ftp_proxy
set -gx NO_PROXY $no_proxy
# Scoped keys (recommended)
# export AVANTE_ANTHROPIC_API_KEY=your-claude-api-key
# export AVANTE_OPENAI_API_KEY=your-openai-api-key
# export AVANTE_AZURE_OPENAI_API_KEY=your-azure-api-key
# export AVANTE_CO_API_KEY=your-cohere-api-key
# export AVANTE_AIHUBMIX_API_KEY=your-aihubmix-api-key
# export AVANTE_MOONSHOT_API_KEY=your-moonshot-api-key
# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba shell init' !!
set -gx MAMBA_EXE "$HOME/miniforge3/bin/mamba"
set -gx MAMBA_ROOT_PREFIX "$HOME/miniforge3"
$MAMBA_EXE shell hook --shell fish --root-prefix $MAMBA_ROOT_PREFIX | source
# <<< mamba initialize <<<
