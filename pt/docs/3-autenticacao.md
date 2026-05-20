## 3. Autenticação

> [!IMPORTANT]
> **Esta página foi movida.**
>
> A documentação da API do VTEX Ads agora faz parte do Portal do Desenvolvedor oficial da VTEX: [VTEX Ads API em developers.vtex.com](https://developers.vtex.com/docs/api-reference/vtex-ads-api).
>
> Atualize seus favoritos. Esta página não é mais mantida.

A autenticação é utilizada para envio de catálogo, consumo de relatórios e gerenciamento. As demais chamadas, como consulta de anúncios e notificação de eventos, são públicas e não exigem autenticação.

Para os endpoints protegidos, as credenciais devem ser enviadas via header HTTP. Solicite as suas credenciais ao gerente de conta.

| Atributo | Descrição |
| :--- | :--- |
| `x-app-id` | ID exclusivo da sua aplicação para a integração. |
| `x-api-key` | Chave de API associada à sua aplicação. |
