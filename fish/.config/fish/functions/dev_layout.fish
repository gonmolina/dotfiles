#!/usr/bin/env fish

# Nombre del layout de Zellij
set -l zellij_layout "dev_layout"

# Carpeta de trabajo
set -l dev_dir "$HOME/dev"

# Asegurarse de que la carpeta exista
if not test -d "$dev_dir"
    echo "Creando directorio $dev_dir..."
    mkdir -p "$dev_dir"
end

# Iniciar la sesión de Zellij con el layout
zellij --layout $zellij_layout
