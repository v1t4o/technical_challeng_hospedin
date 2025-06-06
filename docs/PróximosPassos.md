# O Que Faria nos Próximos Passos

Para transformar esta solução protótipo em um sistema robusto e pronto para produção, minhas próximas prioridades seriam:

- **Integração Real com o Pagar.me**: Utilizando o gateway de pagamento e habilitando webhooks para notificação de mudanças nos pagamentos.

- **Desenvolver módulo de assinatura**: Através disso seria possível gerir pagamentos com mais de um produto de forma mais eficaz.

- **Implementar autenticação entre API e Web**: Usando um JWT (JSON Web Token), por exemplo.

- **Implementar autenticação no Web**: Através do Devise e estabelecendo uma política de permissões com o CanCanCan.

- **Ajustar os logs de erros da API**: Sobretudo ao integrar com o gateway real.

- **Ajustar as mensagens exibidas ao usuário**: De forma a melhorar a experiência.

- **Implementar paginação na API**: Na rota de listagem de pagamentos. Com isso, adicionar a paginação no frontend também.

- **Implementar métricas das aplicações**: (ex.: Prometheus)

- **Implementar tracing na aplicação**: (ex.: OpenTelemetry)

- **Implementar testes unitários na API**

- **Implementar testes unitários e de integração na aplicação Web**

- **Configurar swagger para documentação de rotas da API**