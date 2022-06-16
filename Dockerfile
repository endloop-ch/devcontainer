FROM ubuntu:20.04
 
# Format Bash
RUN echo 'alias ls="ls -all --color=auto"' >> /root/.bashrc
 
# Install OS essentials
RUN apt update
RUN apt install curl sudo git -y
 
# Install Nodejs
RUN curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash -
RUN apt install nodejs
 
# Install Framework7 (requires Nodejs)
RUN npm install framework7 framework7-cli -g