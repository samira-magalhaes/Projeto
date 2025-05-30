# 🔐 SafeChat

O **SafeChat** é uma aplicação de chat seguro ponto-a-ponto que combina criptografia avançada com autenticação mútua entre clientes e servidor. Desenvolvido com foco em segurança, privacidade e confiabilidade, o sistema utiliza técnicas modernas de criptografia e autenticação como **RSA**, **AES-GCM**, **assinatura digital** e **mutual TLS (mTLS)**.

## 📦 Tecnologias Utilizadas

### Backend
- **Python 3.11+**
- **FastAPI**
- **SQLAlchemy + SQLite**
- **Cryptography (RSA, AES-GCM, Assinaturas Digitais)**
- **OpenSSL (certificados e mTLS)**
- **Docker**

### Frontend
- **Flask**
- **HTML + CSS + JavaScript**
- **Bootstrap 5**
- **Flask-WTF + Flask-Login**
- **Jinja2 Templates**

## 🔐 Funcionalidades de Segurança

- Criptografia de ponta-a-ponta com AES-GCM
- Chaves RSA 4096 bits por usuário
- Assinaturas digitais para integridade/autenticidade
- Autenticação mútua com TLS (mTLS)
- Certificados cliente e servidor
- HTTPS completo com verificação de certificados

## 🚀 Como Executar Localmente

### Pré-requisitos
- Docker e Docker Compose instalados
- Porta 443 e 80 disponíveis

### 1. Clone o repositório

```bash
git clone https://github.com/samira-magalhaes/Projeto.git
cd SafeChat
```

### 2. Gere os certificados

```bash
cd safechat-backend/certs
bash generate_certs.sh
```

### 3. Suba o ambiente com Docker Compose

```bash
docker-compose up --build
```

Acesse via navegador: `https://localhost`

## 📁 Estrutura de Diretórios

```
SafeChat/
├── safechat-backend/
│   ├── app/
│   ├── certs/
│   └── Dockerfile
├── safechat-frontend/
│   ├── app/
│   ├── db/
│   ├── nginx/
│   ├── docker-compose.yaml
│   └── .env
```

## 🧪 Testes

Rode os testes unitários do backend:

```bash
cd safechat-backend
pytest
```

## ✅ Considerações Finais

O SafeChat é composto por dois módulos:

- Backend com FastAPI e criptografia ponta-a-ponta (RSA + AES + assinatura + mTLS)
- Frontend com Flask, autenticação segura e chat

Ele é ideal para aprender práticas reais de segurança em aplicações web.

## 🤝 Contribuição

Contribuições são bem-vindas!

1. Faça um fork
2. Crie uma branch: `git checkout -b minha-feature`
3. Commit: `git commit -m 'Minha contribuição'`
4. Push: `git push origin minha-feature`
5. Abra um Pull Request

## 🛡️ Aviso de Segurança

Este projeto é **educacional**. Para ambientes reais, recomenda-se:

- Certificados de CA confiável
- Armazenamento de segredos em cofre (Vault, AWS Secrets)
- Atualização contínua de dependências
- Auditorias regulares de segurança

## 📄 Licença

Distribuído sob a licença MIT. Veja o arquivo `LICENSE` para detalhes.
