#!/bin/bash

export USER=root
export DISPLAY=:1

# iniciar dbus
service dbus start

# configurar password VNC
mkdir -p /root/.vnc
echo "kali" | vncpasswd -f > /root/.vnc/passwd
chmod 600 /root/.vnc/passwd

# limpiar sesiones previas
vncserver -kill :1 > /dev/null 2>&1 || true

# iniciar VNC
vncserver :1 -geometry 1280x800 -depth 24

# iniciar noVNC (web)
websockify --web=/usr/share/novnc/ 6080 localhost:5901 &

# iniciar entorno gráfico XFCE correctamente
dbus-launch startxfce4 &

# esperar a que levante todo
sleep 10

# lanzar PcapXray
cd /root/PcapXray
python3 Source/main.py &

# mantener contenedor activo
tail -f /dev/null