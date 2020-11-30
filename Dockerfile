FROM codercom/code-server:3.7.3

RUN sudo apt-get update && \
    sudo apt-get install -y zip unzip && \
    sudo apt-get install -y fonts-firacode && \
    sudo apt-get install -y openjdk-11-jdk && \
    sudo apt-get -q clean -y && \
    sudo rm -rf /var/lib/apt/lists/*

## EXTENSOES ##
RUN sudo apt-get update && \
    sudo apt-get install -y bsdtar &&\
    sudo apt-get -q clean -y && \
    sudo rm -rf /var/lib/apt/lists/*

RUN mkdir -p /home/coder/.local/share/code-server/extensions
COPY --chown=coder:coder install-extensions.sh install-extensions.sh
RUN ./install-extensions.sh
COPY --chown=coder:coder settings-vscode.json /home/coder/.local/share/code-server/User/settings.json
## EXTENSOES ##


## ZSH ##
RUN sudo apt-get update && \
    sudo apt-get install -y zsh && \
    sudo apt-get -q clean -y && \
    sudo rm -rf /var/lib/apt/lists/* && \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

WORKDIR /home/coder/
RUN openssl req \
    -newkey rsa:2048 -nodes -keyout cert.key \
    -x509 -days 365 -out cert.crt \
    -subj "/C=BR/ST=MG/L=BH/O=Global Security/OU=IT Department/CN=example.com"

WORKDIR /home/coder/Documents
RUN sudo chown -R coder:coder /home/coder/Documents