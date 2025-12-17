# Configuración de la red

La configuración de la red se logró ejecutando los siguientes comandos:

 ``` bash
sudo nmcli con mod "Wires connection 2" ipv4.method manual ipv4.addresses 10.73.32.106/24

# Configurar la puerta de enlace (Gateway)
sudo nmcli con mod "Wired connection 2" ipv4.gateway 10.73.32.2

# Configurar los servidores DNS
sudo nmcli con mod "Wired connection 2" ipv4.dns "10.73.32.17, 10.73.32.18"
```

Luego se ejecutó

``` bash
sudo nmcli device reapply enp6s0f1 
sudo nmcli con down "Wired connection 2"
sudo nmcli con up "Wired connection 2"
```



