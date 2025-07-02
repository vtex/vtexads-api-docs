# Sponsored Products - Category Page Context

This example demonstrates how to request sponsored product ads in the category page context.

## Request

```bash
curl --location 'https://newtail-media.newtail.com.br/v1/rma/{PUBLISHER_ID}' \
--header 'Accept-Encoding: deflate' \
--header 'Content-Type: application/json' \
--data '{
    "context": "category",
    "category_name": "{CATEGORY_NAME}",
    "channel": "site",
    "user_id": "{USER_ID}",
    "session_id": "{SESSION_ID}",
    "placements": {
        "{PLACEMENT_NAME}": { "quantity": 1, "types": ["product"] }
    }
}'
```

## Response

```json
{
    "query_at": "2025-07-01T23:11:01.978059626+00:00",
    "query_id": "e58750c6-fbd6-448b-8675-3f48dd762621",
    "request_id": "d990c35e-4a9a-4ae5-ad0e-133db7e30d3b",
    "{PLACEMENT_NAME}": [
        {
            "ad_id": "{AD_ID}",
            "campaign_name": "{CAMPAIGN_NAME}",
            "click_url": "https://events.newtail-media.newtail.com.br/v1/beacon/click/{AD_ID}?publisher_id={PUBLISHER_ID}&ad_type=product&campaign_id={CAMPAIGN_ID}&pname={PLACEMENT_NAME}&context=category&cat_term={CATEGORY_NAME}&channel=site&event_id=f83fdae1-7bfb-462d-9dec-0f3baf4dce50&request_id=d990c35e-4a9a-4ae5-ad0e-133db7e30d3b&session_id={SESSION_ID}&user_id={USER_ID}&requested_at=1751411461978&sign=3046d9cbf15ddf287c67a782c206c6197c9429515e9e11ca1de4d29b77a9e6d5",
            "destination_url": "smartphone-motorola-moto-g75-azul-5g-256gb-8gb-ram-8gb-ram-boost-50mp-sony-lytia-600-camera-moto-ai-ultrarresistencia-militar/p/55067652",
            "impression_url": "https://events.newtail-media.newtail.com.br/v1/beacon/impression/{AD_ID}?publisher_id={PUBLISHER_ID}&ad_type=product&campaign_id={CAMPAIGN_ID}&pname={PLACEMENT_NAME}&context=category&cat_term={CATEGORY_NAME}&channel=site&event_id=f83fdae1-7bfb-462d-9dec-0f3baf4dce50&request_id=d990c35e-4a9a-4ae5-ad0e-133db7e30d3b&session_id={SESSION_ID}&user_id={USER_ID}&requested_at=1751411461978&sign=f618b6a62ba332c66cb6b80a093ba0dd687965f8cf99b2ae740852a76b61fce2",
            "position": 0,
            "product_metadata": {
                "classificacaoMedia": "5",
                "quantidadeAvaliacoes": "252"
            },
            "product_name": "Smartphone Motorola Moto g75 Azul 5G 256GB, 8GB RAM + 8GB RAM Boost, 50MP Sony Lytia 600 Câmera Moto AI Ultrarresistência Militar",
            "product_sku": "55067652",
            "seller_id": null,
            "type": "product",
            "view_url": "https://events.newtail-media.newtail.com.br/v1/beacon/view/{AD_ID}?publisher_id={PUBLISHER_ID}&ad_type=product&campaign_id={CAMPAIGN_ID}&pname={PLACEMENT_NAME}&context=category&cat_term={CATEGORY_NAME}&channel=site&event_id=f83fdae1-7bfb-462d-9dec-0f3baf4dce50&request_id=d990c35e-4a9a-4ae5-ad0e-133db7e30d3b&session_id={SESSION_ID}&user_id={USER_ID}&requested_at=1751411461978&sign=0fe31b97b9ce4606522525957deb2a51abb5d3b37aeeae7f1a233dcada90668e"
        }
    ]
}
```