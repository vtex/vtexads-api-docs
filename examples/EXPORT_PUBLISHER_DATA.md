# EXPORT PUBLISHER DATA - Reports Export Examples

This endpoint allows you to retrieve information about the publisher. The data is returned in JSON format by default, but can be exported as XLSX by including the `download=true` parameter in the query string.

🔹 Important: Only available in the advertiser view.

## Request

```bash
curl --location 'https://api-retail-media.newtail.com.br/report/v2/publishers?start_date=2025-01-01&end_date=2025-01-31' \
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
| `order_by`        | Não         | Campo para ordenação dos resultados. Valores possíveis: `name`, `balance`, `total_daily_budget`, `total_campaigns`, `impressions`, `clicks`, `ctr`, `total_spent`, `conversions`, `conversion_rate`, `income`, `roas`. |
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
      "checking_account_id": "checking-account-id",
      "metrics": {
          "total_campaigns": "560",
          "total_daily_budget": "00999.00",
          "balance": "60001.29",
          "publisher_id": "publisher-id",
          "impressions": "999999",
          "views": "0",
          "clicks": "4954",
          "conversions": "214",
          "conversion_rate": "4.32",
          "total_conversions_items_quantity": "214",
          "ctr": "0.09",
          "income": "581620.1500",
          "ecpm": "0.11",
          "total_spent": "1340.4000",
          "cpa": "6.26",
          "avg_cpc": "0.27",
          "avg_cpm": "0.25",
          "conversions_quantity": "214",
          "roas": "433.92",
          "adcost": "0.23"
      }
    }
  ]
}
```
