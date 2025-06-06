# Projeto de Centralização de Pagamentos

Este repositório contém o setup unificado para o projeto de **Centralização de Pagamentos**, que inclui uma **API de backend** e uma **aplicação web de frontend**. O ambiente é orquestrado usando Docker Compose para facilitar o desenvolvimento e a execução local.

---

# Menu Principal

* [Visão Geral da Arquitetura](docs/Arquitetura.md)
* [Possíveis Desafios de Migração](docs/DesafiosMigração.md)
* [Próximos Passos do Projeto](docs/PróximosPassos.md)

---

## Estrutura do Projeto

A estrutura de diretórios é organizada da seguinte forma:

```
.
├── docker-compose.yml
├── README.md
├── payment_centralization_api/  # Contém o código-fonte da API
│   ├── app/
│   ├── config/
│   └── ...
└── payment_centralization_web/  # Contém o código-fonte da Aplicação Web
    ├── app/
    ├── config/
    └── ...
```

---

## Aplicações Incluídas

Este projeto é composto por duas aplicações principais:

* ### `payment_centralization_api` (Backend - Ruby on Rails API)

    Uma API RESTful responsável por gerenciar e processar as operações de pagamento. Ela interage diretamente com o banco de dados e pode ser integrada com sistemas de pagamento externos.
    * **Tecnologia**: Ruby on Rails (API Mode)
    * **Porta Exposta (no Host)**: `3000`
    * [Acessar README específico da API](payment_centralization_api/README.md)

* ### `payment_centralization_web` (Frontend - Ruby on Rails Web App)

    A aplicação web que serve como interface do usuário para interagir com a `payment_centralization_api`. É onde os usuários podem visualizar, criar e gerenciar pagamentos.
    * **Tecnologia**: Ruby on Rails (Full-stack)
    * **Porta Exposta (no Host)**: `3001`
    * [Acessar README específico da Web](payment_centralization_web/README.md)

---

## Configuração e Execução

Para configurar e rodar todo o ambiente localmente usando Docker:

### Pré-requisitos

Certifique-se de ter o **Docker** e o **Docker Compose** instalados em sua máquina.

### Passos para Iniciar

1.  Navegue até o diretório raiz deste projeto (onde o `docker-compose.yml` está localizado).

2.  Construa as imagens e inicie os serviços:
    ```bash
    make build
    ```
    Este comando irá construir as imagens Docker para a API e a Web (se necessário), iniciar o banco de dados PostgreSQL, executar as migrações e seeds, e subir as aplicações.

3.  Execute as aplicações com o comando abaixo:
    ```bash
    make run
    ```
Uma vez que todos os serviços estejam rodando, você pode acessá-los via seu navegador:

* **API**: `http://localhost:3000`
* **Aplicação Web**: `http://localhost:3001`
