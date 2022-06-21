# Build using:
# > docker build -t docker-ubuntu-rdp .

FROM ubuntu:20.04

RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y ubuntu-desktop

RUN rm /run/reboot-required*

RUN useradd -m elie -p $(openssl passwd 12345678)
RUN usermod -aG sudo elie

RUN apt-get install -y xrdp
RUN adduser xrdp ssl-cert

RUN sed -i '3 a echo "\
  export GNOME_SHELL_SESSION_MODE=ubuntu\\n\
  export XDG_SESSION_TYPE=x11\\n\
  export XDG_CURRENT_DESKTOP=ubuntu:GNOME\\n\
  export XDG_CONFIG_DIRS=/etc/xdg/xdg-ubuntu:/etc/xdg\\n\
  " > ~/.xsessionrc' /etc/xrdp/startwm.sh

RUN apt-get install git pip && \
  cd / && git clone https://github.com/carrot69/keep-presence.git && cd keep-presence && \
  pip3 install pynput

EXPOSE 3389

CMD service dbus start; /usr/lib/systemd/systemd-logind & service xrdp start ; bash
