function pallas_client
    set -x PALLAS_FOLDER "$HOME/dev/CNEAProjects/pallas" 
    cd $PALLAS_FOLDER/pallas_model_devel_station
    wine all_sim_devel.bat
end
