# Payment Centralization Web

Esta é a interface web para a gestão centralizada de pagamentos, construída com Ruby on Rails. Ela consome a `Payment Centralization API` para listar, filtrar e adicionar pagamentos.

## Visão Geral da Arquitetura

- **Tecnologia:** Ruby on Rails (Web Application Mode)
- **Comunicação com API:** Utiliza a gem `HTTParty` e um serviço (`PaymentApiService`) para interagir com a `Payment Centralization API`.
- **Frontend:** HTML com ERB, com estilização básica usando Bootstrap (via CDN).
- **Funcionalidades:**
    - Listagem de pagamentos.
    - Filtros por produto, status, tipo de cobrança e período de data.
    - Formulário para adicionar novos pagamentos manualmente (simulação).
- **Modelagem (Frontend):** Um modelo "dummy" `Payment` é usado apenas para fornecer os valores dos `enums` (produto, status, tipo de cobrança) para os dropdowns e para auxiliar no tratamento de erros do formulário. Não há persistência de dados local.

