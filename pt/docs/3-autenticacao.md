## 3. Autenticação

A autenticação é utilizada para envio de catálogo, consumo de relatórios e gerenciamento. As demais chamadas, como consulta de anúncios e notificação de eventos, são públicas e não exigem autenticação.

Para os endpoints protegidos, as credenciais devem ser enviadas via header HTTP. Solicite as suas credenciais ao gerente de conta.

| Atributo | Descrição |
| :--- | :--- |
| `x-app-id` | ID exclusivo da sua aplicação para a integração. |
| `x-api-key` | Chave de API associada à sua aplicação. |
