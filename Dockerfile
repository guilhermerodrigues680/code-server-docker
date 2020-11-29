FROM codercom/code-server:3.7.3

WORKDIR /home/coder/

RUN openssl req \
    -newkey rsa:2048 -nodes -keyout cert.key \
    -x509 -days 365 -out cert.crt \
    -subj "/C=BR/ST=MG/L=BH/O=Global Security/OU=IT Department/CN=example.com"
