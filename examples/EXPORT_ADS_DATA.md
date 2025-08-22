# EXPORT ADS DATA - Reports Export Examples

This endpoint allows you to fetch all available listings, applying filters as needed. Data is returned in JSON format by default, but can be exported as XLSX by including the `download=true` parameter in the query string.

## Request

```bash
curl --location 'https://api-retail-media.newtail.com.br/ad/results/v2?start_date=2025-01-01&end_date=2025-01-31' \
--header 'x-app-id: XXXX' \
--header 'x-api-key: YYYY' \
--header 'Content-Type: application/json'
```
## Parâmetros da Query

| Parâmetro               | Obrigatório | Descrição                                                                 |
|-------------------------|-------------|---------------------------------------------------------------------------|
| `start_date`            | Sim         | Data de início das métricas no formato `YYYY-MM-DD`.                      |
| `end_date`              | Sim         | Data de fim das métricas no formato `YYYY-MM-DD`.                         |
| `campaign_name`         | Não         | Filtra os anúncios pelo nome da campanha.                                 |
| `campaign_id`           | Não         | Filtra os anúncios pelo ID da campanha.                                   |
| `advertiser_id`         | Não         | Filtra os anúncios pelo ID do anunciante.                                 |
| `product_sku`           | Não         | Filtra os anúncios por um SKU de produto.                                 |
| `ad_status`             | Não         | Filtra anúncios pelo status. Valores possíveis: `enabled`, `paused`, `rejected`, `pending_review`, `stock_out`, `invalid_cost`. |
| `ad_type`               | Não         | Filtra pelo tipo de anúncio. Valores possíveis: `banner`, `product`, `sponsored_brand`, `digital_signage`, `banner_video`, `sponsored_brand_video` . |
| `targeting_type`        | Não         | Filtra pelo tipo de segmentação.                                          |
| `show_inactive`         | Não         | Se `true`, inclui os anúncios que estão pausados.                         |
| `account_info`          | Não         | Se `true`, inclui informações detalhadas da conta no resultado. Padrão: `false`. |
| `page`                  | Não         | Número da página dos resultados. Padrão: `1`.                             |
| `quantity`              | Não         | Quantidade de itens por página. Padrão: `100`.                            |
| `count`                 | Não         | Se `true`, retorna o total de registros disponíveis. Padrão: `false`.     |
| `order_by`              | Não         | Campo para ordenação dos resultados. Valores possíveis: `ad_type`, `ad_status`, `impressions`, `conversion_rate`, `ctr`, `income`, `total_spent`, `roas`, `conversions`, `total_conversions_item_quantity`. |
| `order_direction`       | Não         | Direção da ordenação. Valores possíveis: `asc` (crescente) ou `desc` (decrescente). |
| `download`              | Não         | Se `true`, retorna um buffer de arquivo XLSX para download ao invés de JSON. |

```
Important: Paused ads are excluded from the default response. To include paused ads in your query, use the following parameter: `"show_inactive": true`
```

## Response

```json
{
  "total": 1,
  "pages": 1,
  "currentPage": 1,
  "data": [
    {
			"id": "ad-id",
			"campaign_id": "campaign-id",
			"url": "ad-url",
			"settings": {
				"ad_size": "370x100",
				"alt_text": null,
				"media_url": "https://cdn.newtail.com.br/retail_media/ads/example.jpeg",
				"destination_urls": null,
				"type": "banner"
			},
			"disabled_at": null,
			"created_at": "2025-01-27T23:18:16.330Z",
			"updated_at": "2025-01-27T23:18:16.330Z",
			"deleted_at": null,
			"status": "enabled",
			"aid": 1234,
			"asset_type": "image",
			"active": true,
			"product_id": null,
			"product_sku": null,
			"name": null,
			"image_url": null,
			"categories": null,
			"campaign_name": "Campaign Name",
			"ad_type": "banner",
			"campaign_status": "running",
			"campaign_settings": {
				"daily_budget": 185000,
				"cpm": 10000,
				"budget_type": "evenly"
			},
			"publisher_id": "publisher-id",
			"advertiser_id": "advertiser-id",
			"advertiser_name": "Advertiser Name",
			"advertiser_account_id": "advertiser-account-id",
			"publisher_name": "Publisher Name",
			"publisher_account_id": "publisher-account-id",
			"ad_id": "ad-id",
			"conversions_quantity": "1",
			"status_weight": 1,
			"is_running": true,
			"advertiser_tags": null,
			"pending": [],
			"metrics": {
				"clicks": "53",
				"conversions": "1",
				"total_conversions_items_quantity": "1",
				"impressions": "2900",
				"views": "2689",
				"conversion_rate": "1.89",
				"ctr": "1.83",
				"roas": "0.18",
				"adcost": "540.94",
				"income": "5361.00",
				"total_spent": "29000.0000",
				"ecpm": "1.85",
				"cpa": "29000.00",
				"avg_cpc": "547.17",
				"avg_cpm": "10000.00"
			}
		}
  ]
}
```
