function pallas_client
    set -x PALLAS_FOLDER "$HOME/dev/CNEAProjects/pallas" 
    cd $PALLAS_FOLDER/pallas_model_devel_station
    wine client-server_devel.bat
end
