# Visão Geral da Arquitetura Proposta

A solução que construí é composta por duas aplicações independentes, ambas desenvolvidas em Ruby on Rails, seguindo o princípio da **separação de responsabilidades**. Isso garante **flexibilidade, escalabilidade** e facilita a manutenção de cada componente.

---

## 1. Payment Centralization API (Backend)

* **Tecnologia**: Ruby on Rails no modo API.

  Atua como o core da centralização de pagamentos. É responsável por **registrar, armazenar e consultar** todas as transações, unificando os dados dos diferentes produtos (PMS, Motor de Reservas, Channel Manager) e eliminando a necessidade de interagir diretamente com múltiplos gateways.

* **Endpoints**: Oferece endpoints RESTful (`/api/v1/payments`) para:

  * **Registrar pagamentos** (`POST`): Recebe os dados de uma nova transação.

  * **Consultar pagamentos** (`GET`): Permite listar pagamentos com filtros flexíveis (por produto, status, tipo de cobrança e período de data).

---

## 2. Payment Centralization Web (Frontend)

* **Tecnologia**: Ruby on Rails no modo de aplicação web tradicional.

  É a **interface de usuário** que permite a visualização e gestão dos pagamentos. Ela não armazena dados localmente, mas se comunica exclusivamente com a API para obter e enviar informações.

---

Essa arquitetura desacoplada permite que a **API seja consumida por outras aplicações** (como o PMS real futuramente) e que a **interface web possa evoluir independentemente**, ou até ser substituída por uma aplicação em outra tecnologia de frontend, sem impactar a lógica central de pagamentos.
