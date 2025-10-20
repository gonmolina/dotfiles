#!/usr/bin/env fish
function pallas
    set -x PALLAS_FOLDER "$HOME/dev/CNEAProjects/pallas" 
    set -x PYTHONPATH "$PALLAS_FOLDER/pyblock:$PALLAS_FOLDER/pywd:$PALLAS_FOLDER/webdiagram:$PALLAS_FOLDER/pyelec:$PALLAS_FOLDER/lib_pallas"

    # Nombre de la sesión de tmux
    set -gx session_name "pallas"

    # Nombre del entorno de Conda que quieres activar
    set -gx conda_env_name "webdiagram"

    # Comando para el primer programa
    set -gx prog11_cmd "mamba shell $conda_env_name" 
    set -gx prog12_cmd "$PALLAS_FOLDER/build/src/server -m mongodb://pallasUSER:peql1234@10.73.32.33/test -db pallas -h 0.0.0.0"

    # Comando para el segundo programa
    # set prog2_cmd "mamba shell $conda_env_name && cd webdiagram && python webDiagram.py"
    set prog2_cmd "cd webdiagram && python webDiagram.py"
    set prog3_cmd "nvim ."

    cd $HOME/dev/CNEAProjects/pallas/

    # Conectar a la sesión o crearla si no existe
    tmux new-session -d -s $session_name
    tmux send-keys -t $session_name "$prog11_cmd" C-m
    sleep 0.3
    tmux send-keys -t $session_name "$prog12_cmd" C-m


    # Dividir la ventana horizontalmente y ejecutar el segundo programa
    tmux split-window -h -t $session_name
    tmux send-keys -t $session_name "$prog11_cmd" C-m 
    sleep 0.3
    tmux send-keys "$prog2_cmd" C-m

    tmux new-window -t $session_name -n "dev" 
    tmux send-keys -t $session_name "$prog11_cmd" C-m 
    sleep 0.3
    tmux send-keys -t $session_name "$prog3_cmd" C-m

    # Conectar a la sesión para ver los paneles
    tmux attach-session -t $session_name   # micromamba activate webdiagram
end

# function pallas_client 
#     cd $PALLAS_FOLDER 
#     wine $PALLAS_FOLDER/pallas_model_devel_station/client_server.bat
# end

