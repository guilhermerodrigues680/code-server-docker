FROM codercom/code-server:3.7.3

WORKDIR /root/.self-signed-certificate

RUN openssl req -newkey rsa:2048 -nodes -keyout cert.key -x509 -days 365 -out cert.crt

WORKDIR /home/coder

CMD [ "--cert /root/.self-signed-certificate/cert.crt --cert-key /root/.self-signed-certificate/cert.key" ]