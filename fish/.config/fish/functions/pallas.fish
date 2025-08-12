function pallas
    set -x pallas_folder "$HOME/dev/CNEAProjects/pallas"
    set -x PYTHONPATH "$pallas_folder/pyblock:$pallas_folder/pywd:$pallas_folder/webdiagram:$pallas_folder/pyelec:$pallas_folder/lib_pallas"
    echo "PYTHONPATH set at $PYTHONPATH"
    cd $HOME/dev/CNEAProjects/pallas/ 
    mamba shell webdiagram
end
