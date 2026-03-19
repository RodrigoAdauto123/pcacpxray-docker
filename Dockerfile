FROM kalilinux/kali-rolling

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
    python3 python3-pip python3-tk \
    git graphviz \
    xfce4 xfce4-goodies \
    tightvncserver novnc websockify \
    dbus-x11 x11-xserver-utils \
    net-tools wget curl \
    && apt clean

# Clonar PcapXray
WORKDIR /root
RUN git clone https://github.com/Srinivas11789/PcapXray.git

WORKDIR /root/PcapXray

# Eliminar dependencia incompatible (ARM)
RUN sed -i '/cefpython3/d' requirements.txt

# Instalar dependencias Python
RUN pip3 install --break-system-packages --upgrade pip
RUN pip3 install --break-system-packages -r requirements.txt
RUN pip3 install --break-system-packages netaddr==0.7.19 ipwhois Pillow

# Fix Pillow (compatibilidad con versiones nuevas)
RUN sed -i '1i from PIL import Image\nImage.ANTIALIAS = Image.LANCZOS' Source/Module/user_interface.py

# Copiar script de inicio
COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 6080

CMD ["/start.sh"]