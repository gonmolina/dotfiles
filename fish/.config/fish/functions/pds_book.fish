function pds_book
    set -x pds_folder "$HOME/Documents/materias/laboratorio_pds/"
    cd $pds_folder
    micromamba activate dyc
    nvim .
end
