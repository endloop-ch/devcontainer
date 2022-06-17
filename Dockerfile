# Select linux base image
FROM ubuntu:20.04

# Install OS essentials
RUN apt update
RUN apt install curl sudo git -y

# Create user and group
ARG GID
ARG UID
ARG USERNAME
ARG GROUPNAME
ARG WORKDIR
RUN sudo groupadd -g $GID $GROUPNAME
RUN useradd -m -u $UID -g $GID $USERNAME

# Format Bash
RUN echo 'alias ls="ls -all --color=auto"' >> /home/$USERNAME/.bashrc

# Create working directory
RUN mkdir /home/$USERNAME/$WORKDIR
RUN chown -R $USERNAME:$GROUPNAME /home/$USERNAME/
WORKDIR /home/$USERNAME/$WORKDIR

# Install Nodejs
RUN curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
RUN apt install nodejs
 
# Install Framework7 (requires Nodejs 14.x)
RUN npm install cordova framework7 framework7-cli -g --unsafe-perm=true --allow-root