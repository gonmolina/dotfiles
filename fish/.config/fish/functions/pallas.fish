#!/usr/bin/env fish
function pallas
    set -x PALLAS_FOLDER "$HOME/dev/CNEAProjects/pallas" 
    set -x PYTHONPATH "$PALLAS_FOLDER/pyblock:$PALLAS_FOLDER/pywd:$PALLAS_FOLDER/webdiagram:$PALLAS_FOLDER/pyelec:$PALLAS_FOLDER/lib_pallas"
    # echo "PYTHONPATH set at $PYTHONPATH"
    cd $HOME/dev/CNEAProjects/pallas/

    # Nombre de la sesión de tmux
    set session_name "pallas"

    # Nombre del entorno de Conda que quieres activar
    set conda_env_name "webdiagram"

    # Comando para el primer programa
    set prog1_cmd "micromamba activate $conda_env_name && $PALLAS_FOLDER/build/src/server -m mongodb://pallasUSER:peql1234@10.73.32.33/test -db pallas -h 0.0.0.0"

    # Comando para el segundo programa
    set prog2_cmd "micromamba activate $conda_env_name && cd webdiagram && python webDiagram.py"

    set prog3_cmd "micromamba activate $conda_env_name && nvim ."

    # Conectar a la sesión o crearla si no existe
    # tmux new-session -d -s $session_name
    # tmux send-keys -t $session_name:0 "$prog1_cmd" Enter 
    tmux new-session -d -s $session_name -n "server" $prog1_cmd

    # Dividir la ventana horizontalmente y ejecutar el segundo programa
    tmux split-window -t $session_name -h $prog2_cmd
    # tmux split-window -h -t $session_name
    tmux send-keys "$prog2_cmd" Enter

    tmux new-window -t $session_name -n "dev" 
    tmux send-keys -t $session_name "$prog3_cmd" Enter

    # Conectar a la sesión para ver los paneles
    tmux attach-session -t $session_name   # micromamba activate webdiagram
end
