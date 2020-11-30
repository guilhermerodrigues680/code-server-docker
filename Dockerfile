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

# Dracula Official
ARG PUBLISHER=dracula-theme
ARG EXTENSIONNAME=theme-dracula
ARG VERSION=2.22.3
RUN curl -L https://${PUBLISHER}.gallery.vsassets.io/_apis/public/gallery/publisher/${PUBLISHER}/extension/${EXTENSIONNAME}/${VERSION}/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage | bsdtar -xvf - extension && \
    mv extension /home/coder/.local/share/code-server/extensions/${PUBLISHER}.${EXTENSIONNAME}-${VERSION}

# Java Extension Pack
ARG PUBLISHER=vscjava
ARG EXTENSIONNAME=vscode-java-pack
ARG VERSION=0.9.1
RUN curl -L https://${PUBLISHER}.gallery.vsassets.io/_apis/public/gallery/publisher/${PUBLISHER}/extension/${EXTENSIONNAME}/${VERSION}/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage | bsdtar -xvf - extension && \
    mv extension /home/coder/.local/share/code-server/extensions/${PUBLISHER}.${EXTENSIONNAME}-${VERSION}

# Language Support for Java by Red Hat 
ARG PUBLISHER=redhat
ARG EXTENSIONNAME=java
ARG VERSION=0.71.0
RUN curl -L https://${PUBLISHER}.gallery.vsassets.io/_apis/public/gallery/publisher/${PUBLISHER}/extension/${EXTENSIONNAME}/${VERSION}/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage | bsdtar -xvf - extension && \
    mv extension /home/coder/.local/share/code-server/extensions/${PUBLISHER}.${EXTENSIONNAME}-${VERSION}

# Debugger for Java
ARG PUBLISHER=vscjava
ARG EXTENSIONNAME=vscode-java-debug
ARG VERSION=0.29.0
RUN curl -L https://${PUBLISHER}.gallery.vsassets.io/_apis/public/gallery/publisher/${PUBLISHER}/extension/${EXTENSIONNAME}/${VERSION}/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage | bsdtar -xvf - extension && \
    mv extension /home/coder/.local/share/code-server/extensions/${PUBLISHER}.${EXTENSIONNAME}-${VERSION}

# Java Test Runner
ARG PUBLISHER=vscjava
ARG EXTENSIONNAME=vscode-java-test
ARG VERSION=0.26.0
RUN curl -L https://${PUBLISHER}.gallery.vsassets.io/_apis/public/gallery/publisher/${PUBLISHER}/extension/${EXTENSIONNAME}/${VERSION}/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage | bsdtar -xvf - extension && \
    mv extension /home/coder/.local/share/code-server/extensions/${PUBLISHER}.${EXTENSIONNAME}-${VERSION}

# Maven for Java
ARG PUBLISHER=vscjava
ARG EXTENSIONNAME=vscode-maven
ARG VERSION=0.26.0
RUN curl -L https://${PUBLISHER}.gallery.vsassets.io/_apis/public/gallery/publisher/${PUBLISHER}/extension/${EXTENSIONNAME}/${VERSION}/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage | bsdtar -xvf - extension && \
    mv extension /home/coder/.local/share/code-server/extensions/${PUBLISHER}.${EXTENSIONNAME}-${VERSION}

# Java Dependency Viewer
ARG PUBLISHER=vscjava
ARG EXTENSIONNAME=vscode-java-dependency
ARG VERSION=0.15.0
RUN curl -L https://${PUBLISHER}.gallery.vsassets.io/_apis/public/gallery/publisher/${PUBLISHER}/extension/${EXTENSIONNAME}/${VERSION}/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage | bsdtar -xvf - extension && \
    mv extension /home/coder/.local/share/code-server/extensions/${PUBLISHER}.${EXTENSIONNAME}-${VERSION}

# Visual Studio IntelliCode
ARG PUBLISHER=VisualStudioExptTeam
ARG EXTENSIONNAME=vscodeintellicode
ARG VERSION=1.2.10
RUN curl -L https://${PUBLISHER}.gallery.vsassets.io/_apis/public/gallery/publisher/${PUBLISHER}/extension/${EXTENSIONNAME}/${VERSION}/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage | bsdtar -xvf - extension && \
    mv extension /home/coder/.local/share/code-server/extensions/${PUBLISHER}.${EXTENSIONNAME}-${VERSION}

# GitLens — Git supercharged
ARG PUBLISHER=eamodio
ARG EXTENSIONNAME=gitlens
ARG VERSION=11.0.6
RUN curl -L https://${PUBLISHER}.gallery.vsassets.io/_apis/public/gallery/publisher/${PUBLISHER}/extension/${EXTENSIONNAME}/${VERSION}/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage | bsdtar -xvf - extension && \
    mv extension /home/coder/.local/share/code-server/extensions/${PUBLISHER}.${EXTENSIONNAME}-${VERSION}

COPY --chown=coder:coder settings-vscode.json /home/coder/.local/share/code-server/User/settings.json
## EXTENSOES ##

WORKDIR /home/coder/
RUN openssl req \
    -newkey rsa:2048 -nodes -keyout cert.key \
    -x509 -days 365 -out cert.crt \
    -subj "/C=BR/ST=MG/L=BH/O=Global Security/OU=IT Department/CN=example.com"

WORKDIR /home/coder/Documents
RUN sudo chown -R coder:coder /home/coder