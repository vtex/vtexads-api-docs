## 1. Resumo

Esta documentação detalha a integração com a **Retail Media API**, o ponto central de conexão entre a solução da VTEX Ads e a plataforma do varejista (publisher). A solução foi desenvolvida sob o conceito **API-first**, garantindo flexibilidade total para que os varejistas integrem e exibam anúncios em qualquer canal digital: e-commerce, marketplace, aplicativo ou até mesmo em totens e telas físicas (Digital Signage).

Nossa arquitetura é **cookie-less**, o que significa que não dependemos de cookies de terceiros. A identificação e segmentação são baseadas em identificadores próprios (`user_id`, `session_id`) e dados primários (first-party data), garantindo uma solução robusta, em conformidade com as novas políticas de privacidade e preparada para o futuro do varejo digital.

Através desta API REST, sua plataforma poderá:
* Sincronizar o catálogo de produtos e inventário.
* Requisitar anúncios relevantes em tempo real para o contexto de navegação do usuário.
* Enviar eventos de interação (impressão, visualização, clique, conversão) para mensuração de performance.
