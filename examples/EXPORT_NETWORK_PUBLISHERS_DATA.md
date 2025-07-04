# EXPORT NETWORK PUBLISHER DATA - Reports Export Examples

This endpoint allows you to retrieve information about publishers associated with a Network Publisher account. Data is returned in JSON format by default, but can be exported as XLSX by including the `download=true` parameter in the query string.

🔹 Important: Only publishers operating in the Network format are allowed to access this report.

## Request

```bash
curl --location 'https://api-retail-media.newtail.com.br/report/network/publishers?start_date=2025-01-01&end_date=2025-01-31' \
--header 'x-app-id: XXXX' \
--header 'x-api-key: YYYY' \
--header 'Content-Type: application/json'
```

## Parâmetros da Query

| Parâmetro         | Obrigatório | Descrição                                                                 |
|-------------------|-------------|---------------------------------------------------------------------------|
| `start_date`      | Sim         | Data de início das métricas no formato `YYYY-MM-DD`.                      |
| `end_date`        | Sim         | Data de fim das métricas no formato `YYYY-MM-DD`.                         |
| `publisher_name`  | Não         | Filtra os resultados pelo nome do publisher.                              |
| `account_info`    | Não         | Se `true`, inclui informações detalhadas da conta no resultado. Padrão: `false`. |
| `page`            | Não         | Número da página dos resultados. Padrão: `1`.                             |
| `quantity`        | Não         | Quantidade de itens por página. Padrão: `100`.                            |
| `count`           | Não         | Se `true`, retorna o total de registros disponíveis. Padrão: `false`.     |
| `order_by`        | Não         | Campo para ordenação dos resultados. Valores possíveis: `name`, `impressions`, `clicks`, `ctr`, `conversions`, `conversion_rate`, `income`, `roas`, `requests`. |
| `order_direction` | Não         | Direção da ordenação. Valores possíveis: `asc` (crescente) ou `desc` (decrescente). |
| `download`        | Não         | Se `true`, retorna um buffer de arquivo XLSX para download ao invés de JSON. |

## Response

```json
{
  "total": 1,
  "pages": 1,
  "currentPage": 1,
  "data": [
    {
      "id": "publisher-id",
      "name": "publisher-name",
      "account_id": "publisher-account-name",
      "metrics": {
          "publisher_id": "publisher-id",
          "impressions": "0",
          "views": "0",
          "clicks": "0",
          "conversions": "0",
          "conversion_rate": "0",
          "total_conversions_items_quantity": "0",
          "ctr": "0",
          "income": "0.00",
          "ecpm": "0",
          "total_spent": "0.0000",
          "cpa": "0",
          "avg_cpc": "0",
          "avg_cpm": "0",
          "conversions_quantity": "0",
          "roas": "0.0",
          "adcost": "0.0",
          "requests": "1"
      }
    }
  ]
}
```
