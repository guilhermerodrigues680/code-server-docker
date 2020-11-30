# Visual Studio Code no Docker

- Configurando para ambiente JAVA por enquanto

---

## Ambiente

Iniciando container
```sh
docker-compose up -d
```

- Acesso a IDE pela porta `8082`
- Senha padrao: `yourpassword`
- Portas disponiveis para outras aplicacoes na IDE: `8090`, `8091`, `8092`, `8093`, `8094`

---

### Dicas JAVA

Criando app com quarkus
```sh
curl --output https://downloads.apache.org/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.zip
unzip apache-maven-3.6.3-bin.zip

apache-maven-3.6.3/bin/mvn io.quarkus:quarkus-maven-plugin:1.9.2.Final:create \
    -DprojectGroupId=com \
    -DprojectArtifactId=projeto \
    -DclassName="com.projeto.App" \
    -Dpath="/hello"


cd projeto

# quarkus.http.port=8090
./mvnw clean quarkus:dev
```

---
