# EXPORT CAMPAIGNS LIST DATA - Reports Export Examples

This endpoint allows you to fetch all available campaigns, applying filters as needed. Data is returned in JSON format by default, but can be exported as XLSX by including the `download=true` parameter in the query string.

## Request

```bash
curl --location 'https://api-retail-media.newtail.com.br/campaign/v2?start_date=2025-01-01&end_date=2025-01-31' \
--header 'x-app-id: XXXX' \
--header 'x-api-key: YYYY' \
--header 'Content-Type: application/json'
```
## Parâmetros da Query

| Parâmetro         | Obrigatório | Descrição                                                                 |
|-------------------|-------------|---------------------------------------------------------------------------|
| `start_date`      | Sim         | Data de início das métricas no formato `YYYY-MM-DD`.                      |
| `end_date`        | Sim         | Data de fim das métricas no formato `YYYY-MM-DD`.                         |
| `status`          | Não         | Filtra pelo status da campanha.                                           |
| `advertiser_id`   | Não         | Filtra campanhas por ID do anunciante.                                    |
| `ad_type`         | Não         | Filtra pelo tipo de anúncio.                                              |
| `name`            | Não         | Busca campanhas pelo nome.                                                |
| `account_info`    | Não         | Se `true`, inclui informações detalhadas da conta no resultado. Padrão: `false`. |
| `page`            | Não         | Número da página dos resultados. Padrão: `1`.                             |
| `quantity`        | Não         | Quantidade de itens por página. Padrão: `100`.                            |
| `count`           | Não         | Se `true`, retorna o total de registros disponíveis. Padrão: `false`.     |
| `order_by`        | Não         | Campo para ordenação dos resultados. Valores possíveis: `name`, `impressions`, `clicks`, `ctr`, `conversions`, `conversion_rate`, `income`, `roas`, `created_at`, `start_at`, `daily_budget`, `ad_type`, `advertiser_name`, `status`. |
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
      "id": "campaign-id",
      "advertiser_id": "advertiser-id",
      "name": "Campaign Name",
      "status": "partial_running",
      "type": "on_site",
      "settings": {
        "daily_budget": 10000,
        "cpc": 250,
        "budget_type": "evenly"
      },
      "start_at": "2025-01-01T00:00:00.000Z",
      "end_at": "2025-01-31T00:00:00.000Z",
      "disabled_at": null,
      "created_at": "2025-01-01T07:33:08.482Z",
      "updated_at": "2025-01-26T16:16:08.482Z",
      "deleted_at": null,
      "description": null,
      "publisher_id": "publisher-id",
      "ad_type": "product",
      "cid": 16674,
      "seller_id": null,
      "target": "target-name",
      "network_id": null,
      "audience_id": null,
      "targeting_type": null,
      "strategy_type": "standard",
      "total_budget": "0.0000",
      "active": true,
      "advertiser_name": "advertiser name",
      "advertiser_account_id": "advertiser-account-id",
      "publisher_name": "publisher-name",
      "publisher_account_id": "publisher-account-id",
      "consumed_budget": "1750.0000",
      "daily_budget": "10000.00",
      "campaign_status": 1,
      "advertiser_tags": null,
      "pending": [],
      "metrics": {
        "clicks": 39,
        "conversions": 4,
        "impressions": 7603,
        "views": 51,
        "conversion_rate": "10.26",
        "ctr": ".51",
        "roas": "2.64",
        "adcost": "37.87",
        "income": "25747.00",
        "total_spent": "9750.00",
        "ecpm": "3.3864",
        "cpa": "2437.50",
        "avg_cpc": "250.00",
        "avg_cpm": "1282.39"
      }
    }
  ]
}
```
