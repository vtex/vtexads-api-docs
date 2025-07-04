# EXPORT ADVERTISER DATA - Reports Export Examples

This endpoint allows you to retrieve information from all advertisers associated with a publisher account. The data is returned in JSON format by default, but can be exported in XLSX by adding the `download=true` parameter to the query string.

🔹 Important: Only available in the publisher view.

## Request

```bash
curl --location 'https://api-retail-media.newtail.com.br/report/v2/advertisers?start_date=2025-01-01&end_date=2025-01-31' \
--header 'x-app-id: XXXX' \
--header 'x-api-key: YYYY' \
--header 'Content-Type: application/json'
```

## Parâmetros da Query

| Parâmetro      | Obrigatório | Descrição                                                                        |
| -------------- | ----------- | -------------------------------------------------------------------------------- |
| `start_date`   | Sim         | Data de início das métricas no formato YYYY-MM-DD.                               |
| `end_date`     | Sim         | Data de fim das métricas no formato YYYY-MM-DD.                                  |
| `account_info` | Não         | Se `true`, inclui informações detalhadas da conta no resultado. Padrão: `false`. |
| `page`         | Não         | Número da página dos resultados. Padrão: `1`.                                    |
| `quantity`     | Não         | Quantidade de itens por página. Padrão: `100`.                                   |
| `count`        | Não         | Se `true`, retorna o total de registros disponíveis. Padrão: `false`.            |
| `download`     | Não         | Se `true`, retorna um buffer de arquivo XLSX para download ao invés de JSON.     |

## Response

```json
{
  "total": 1,
  "pages": 1,
  "currentPage": 1,
  "data": [
    {
      "id": "id",
      "name": "name",
      "account_id": "account-id",
      "checking_account_id": "checking-account-id",
      "seller_id": null,
      "advertiser_tags": null,
      "metrics": {
        "total_campaigns": "100",
        "total_daily_budget": "50000.00",
        "balance": "6756756.40",
        "advertiser_id": "advertiser-id",
        "impressions": "395696",
        "views": "323720",
        "clicks": "1237",
        "conversions": "0",
        "conversion_rate": "0.00",
        "total_conversions_items_quantity": "0",
        "ctr": "0.31",
        "income": "0.0000",
        "ecpm": "0.00",
        "total_spent": "213122.6000",
        "cpa": "0",
        "avg_cpc": "31.99",
        "avg_cpm": "100.00",
        "conversions_quantity": "0",
        "roas": "0.00",
        "adcost": "0.0",
        "consumed_daily_budget": "4407.70"
      }
    }
  ]
}
```
