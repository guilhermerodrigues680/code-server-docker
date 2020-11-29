# https://hub.docker.com/r/codercom/code-server

# Default
docker run -it -p 127.0.0.1:8080:8080 \
  -v "$PWD:/home/coder/project" \
  -u "$(id -u):$(id -g)" \
  codercom/code-server:latest


### LOCAL HTTP ###

docker run -d \
  --name code-server \
  -p 8080:8080 \
  -v "$PWD:/home/coder/project" \
  -u "$(id -u):$(id -g)" \
  codercom/code-server:3.7.3

docker exec code-server cat /root/.config/code-server/config.yaml

### HTTPS ###

# https://github.com/cdr/code-server/discussions/1048
# https://www.digitalocean.com/community/tutorials/openssl-essentials-working-with-ssl-certificates-private-keys-and-csrs
# Generate a Self-Signed Certificate
openssl req \
    -newkey rsa:2048 -nodes -keyout domain.key \
    -x509 -days 365 -out domain.crt

docker run -d \
    --name code-server \
    -p 8080:8080 \
    -v "$PWD:/home/coder/project" \
    -u "$(id -u):$(id -g)" \
    -v "$PWD"/domain.crt:/home/coder/cert.crt \
    -v "$PWD"/domain.key:/home/coder/cert.key \
    codercom/code-server:3.7.3 \
    --cert /home/coder/cert.crt \
    --cert-key /home/coder/cert.key

docker exec code-server cat /root/.config/code-server/config.yaml


# drakula
# vs code icons
# zsh (change-default-terminal)
# node (nvm lts/*)
# java (openjdk-11-jdk)
# https://github.com/cdr/code-server/issues/171

docker run -d \
    --name code-server \
    -p 8080:8080 \
    -v "$PWD:/home/coder/project" \
    -u "$(id -u):$(id -g)" \
    -v "$PWD"/domain.crt:/home/coder/cert.crt \
    -v "$PWD"/domain.key:/home/coder/cert.key \
    26178dd34144 \
    --cert /home/coder/cert.crt \
    --cert-key /home/coder/cert.key


###
#curl -JL https://marketplace.visualstudio.com/_apis/public/gallery/publishers/eamodio/vsextensions/gitlens/11.0.6/vspackage | bsdtar -xvf - extension
#mv extension /root/.local/share/code-server/extensions/eamodio.gitlens-11.0.6
