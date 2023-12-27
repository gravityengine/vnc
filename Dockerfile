FROM christian773/xfce-vnc
WORKDIR /content
USER root
RUN apt-get install chromium-browser sudo -y
RUN sudo apt-get install filezilla -y

# User
RUN adduser --disabled-password --gecos '' admin
RUN adduser admin sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN sudo apt-get install qbittorrent -y
RUN sudo apt-get install vlc -y

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y sudo && apt-get install -y python3-pip && pip3 install --upgrade pip
RUN apt-get install -y curl gnupg wget htop sudo git git-lfs software-properties-common build-essential libgl1 zip unzip
RUN sudo chmod a+w /bin && sudo chmod -R a+rwx /root && sudo chmod a+rwx /var/lib/dpkg/lock-frontend && sudo chmod a+rwx /var/lib/dpkg && \
    sudo chmod a+rwx /var/lib/dpkg/lock
RUN sudo chmod -R 777 /headless/ && sudo chmod -R 777 /var/lib/dpkg && sudo chmod -R 777 /content/
RUN sudo chmod -R 777 /var/cache/apt && sudo chmod -R 777 /var/lib/apt/lists/lock && sudo chmod -R 777 /var/lib/apt/lists/
RUN sudo find /var -type d -exec chmod 777 {} \;
RUN sudo find /var -type f -exec chmod 777 {} \;
RUN sudo find /headless -type d -exec chmod 777 {} \;
RUN sudo find /headless -type f -exec chmod 777 {} \;

RUN wget https://downloads.mongodb.com/compass/mongodb-compass_1.40.2_amd64.deb
RUN sudo apt install ./mongodb-compass_*_amd64.deb -y

#install  jsql-injection
RUN sudo apt install default-jdk -y
RUN sudo apt install default-jre -y

RUN sudo apt-get install sqlmap -y

EXPOSE 6901
ENTRYPOINT ["/dockerstartup/desktop_startup.sh"]
