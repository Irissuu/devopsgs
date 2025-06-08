# ⟢ FlowGuard

FlowGuard é um sistema IoT de baixo custo que monitora o nível da água em bueiros urbanos e emite alertas imediatos em caso de risco de alagamento. A solução foi desenvolvida para ser simples, replicável e de grande impacto em áreas com histórico de enchentes.

## 🎥 Vídeo

> <a href="https://youtu.be/CsGkTZecFNg?si=F0nuNjVlRQa3a8Rg">Vídeo</a>

## ⚙️ Tecnologias 

- Java 17
- Spring Boot
- Gradle
- MySQL 8
- Docker
- Dockerfile
- Render

#

## › Requisitos

- Docker instalado na máquina ou VM Linux
- Portas 8080 e 3306 liberadas
- Git instalado
- Java 17 instalado

## ➤ Como Executar

### 1. Clone o projeto

```
git clone https://github.com/Irissuu/devopsgs.git
cd devopsgs
```

### 2. Gere o .jar

```
./gradlew clean bootJar
```

### 3. Crie a rede e o volume

```
docker network create flowguard-net
```

```
docker volume create flowguard-data
```

### 4. Execute o container MySQL

```
docker run -d --name db \
  --network flowguard-net \
  -e MYSQL_DATABASE=flowguard \
  -e MYSQL_USER=user \
  -e MYSQL_PASSWORD=a0b4vk3 \
  -e MYSQL_ROOT_PASSWORD=root \
  -v flowguard-data:/var/lib/mysql \
  -p 3306:3306 \
  mysql:8.0
```

### 5. Construa a imagem da API

```
docker build -t flowguard-api .
```


### 6. Execute a API

```
docker run -d --name flowguard-api \
  --network flowguard-net \
  -e DB_HOST=db \
  -e DB_PORT=3306 \
  -e DB_NAME=flowguard \
  -e DB_USER=user \
  -e DB_PASS=a0b4vk3 \
  -p 8080:8080 \
  flowguard-api
```

### 7. Acesse pelo swagger

```
http://<IP_VM>:8080/swagger-ui/index.html
```

#

## ⟢ Integrantes
 
- Iris Tavares Alves 557728 </br>
- Taís Tavares Alves 557553 </br>
