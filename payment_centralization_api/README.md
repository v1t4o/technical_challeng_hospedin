# Payment Centralization API

Esta é a API RESTful para a gestão centralizada de pagamentos, construída com Ruby on Rails. Ela simula a interação com um gateway de pagamento (Pagar.me) e gerencia o registro e a consulta de transações.

## Visão Geral da Arquitetura

- **Tecnologia:** Ruby on Rails (API Mode)
- **Banco de Dados:** Postgresql
- **Modelagem de Dados:** Um modelo `Payment` que centraliza todas as informações de transações, incluindo `product`, `value`, `status`, `paid_at`, `client_identifier`, `charge_type` e `external_id` (simulando o ID do Pagar.me).
- **Simulação Pagar.me:** A lógica de processamento de pagamentos com o Pagar.me é simulada diretamente no modelo `Payment` via um callback `before_create`. Isso gera um `external_id` e define o `status` (confirmado/falhou) aleatoriamente.
- **Endpoints:**
    - `POST /api/v1/payments`: Registra um novo pagamento.
    - `GET /api/v1/payments`: Consulta pagamentos, com suporte a filtros por `product`, `status`, `charge_type`, `paid_at_start`, `paid_at_end`.
- **Boas Práticas:** Uso de namespaces (`Api::V1`) para versionamento da API, "strong parameters" para segurança, e enums para padronização de dados.