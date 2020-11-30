# install_extension PUBLISHER EXTENSIONNAME VERSION
install_extension() {
    # $1 = PUBLISHER, $2 = EXTENSIONNAME, $3 = VERSION
    echo "Intalando :: PUBLISHER: $1 , EXTENSIONNAME: $2 , VERSION: $3"

    curl -sL https://${1}.gallery.vsassets.io/_apis/public/gallery/publisher/${1}/extension/${2}/${3}/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage | bsdtar -xvf - extension && \
    mv extension /home/coder/.local/share/code-server/extensions/${1}.${2}-${3}

    echo "Sucesso! ${1}.${2}-${3} instalado."
    echo ""
}

####### LISTA DE EXTENSOES #######

# Dracula Official
install_extension dracula-theme theme-dracula 2.22.3

# Java Extension Pack
install_extension vscjava vscode-java-pack 0.9.1

# Language Support for Java by Red Hat 
install_extension redhat java 0.71.0

# Debugger for Java
install_extension vscjava vscode-java-debug 0.29.0

# Java Test Runner
install_extension vscjava vscode-java-test 0.26.0

# Maven for Java
install_extension vscjava vscode-maven 0.26.0

# Java Dependency Viewer
install_extension vscjava vscode-java-dependency 0.15.0

# Visual Studio IntelliCode
install_extension VisualStudioExptTeam vscodeintellicode 1.2.10

# GitLens — Git supercharged
install_extension eamodio gitlens 11.0.6
