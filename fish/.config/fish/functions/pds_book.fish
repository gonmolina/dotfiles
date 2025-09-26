function pds_book
    set -x pds_folder "$HOME/Documents/materias/laboratorio_pds/"
    cd $pds_folder
    mamba shell dyc
    nvim .
end
