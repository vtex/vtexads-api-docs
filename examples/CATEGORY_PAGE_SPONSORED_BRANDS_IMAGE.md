# Sponsored Brands (Image) - Category Page Context

This example demonstrates how to request sponsored brand ads with image assets in the category page context.

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
        "{PLACEMENT_NAME}": { "quantity": 1, "types": ["sponsored_brand"] }
    }
}'
```

## Response

```json
{
    "query_at": "2025-07-01T23:15:11.329513811+00:00",
    "query_id": "f90f882c-449c-41ea-a81f-e473768d2cfe",
    "request_id": "bf0550d7-4ac0-4324-80af-5735e513a932",
    "{PLACEMENT_NAME}": [
        {
            "ad_id": "{AD_ID}",
            "asset_type": "image",
            "assets": [
                {
                    "dimension": "344x132",
                    "type": "image",
                    "url": "https://cdn.newtail.com.br/retail_media/ads/2025/06/16/c816867a85cc409db150b347f37f232e.jpeg"
                },
                {
                    "dimension": "400x176",
                    "type": "image",
                    "url": "https://cdn.newtail.com.br/retail_media/ads/2025/06/16/a5e67eb40fe8f703888bebf791d75148.jpeg"
                }
            ],
            "brand_name": "Midea",
            "brand_url": null,
            "campaign_name": "Home Appliances Showcase",
            "click_url": "https://events.newtail-media.newtail.com.br/v1/beacon/click/{AD_ID}?publisher_id={PUBLISHER_ID}&ad_type=sponsored_brand&campaign_id={CAMPAIGN_ID}&pname={PLACEMENT_NAME}&context=category&cat_term={CATEGORY_NAME}&channel=site&event_id=ce740521-7075-4016-aa59-7248cdb0dc76&request_id=bf0550d7-4ac0-4324-80af-5735e513a932&session_id={SESSION_ID}&user_id={USER_ID}&requested_at=1751411711329&sign=8e6a80ef902c1000975175ad383bd6e4ba91caa324a782a7c31d49a5359dff6e",
            "description": "Midea",
            "destination_url": null,
            "headline": "Midea",
            "impression_url": "https://events.newtail-media.newtail.com.br/v1/beacon/impression/{AD_ID}?publisher_id={PUBLISHER_ID}&ad_type=sponsored_brand&campaign_id={CAMPAIGN_ID}&pname={PLACEMENT_NAME}&context=category&cat_term={CATEGORY_NAME}&channel=site&event_id=ce740521-7075-4016-aa59-7248cdb0dc76&request_id=bf0550d7-4ac0-4324-80af-5735e513a932&session_id={SESSION_ID}&user_id={USER_ID}&requested_at=1751411711329&sign=15f7e3a5751529199f68cdbf9269ec433ec3cd1b6ef0e4b6dd01803692fa45c4",
            "position": 0,
            "products": [
                {
                    "click_url": "https://events.newtail-media.newtail.com.br/v1/beacon/click/{AD_ID}?publisher_id={PUBLISHER_ID}&ad_type=sponsored_brand&campaign_id={CAMPAIGN_ID}&pname={PLACEMENT_NAME}&context=category&cat_term={CATEGORY_NAME}&product_sku=55069360&channel=site&event_id=0564df08-7cd7-463a-bc50-1bfc98529bde&request_id=bf0550d7-4ac0-4324-80af-5735e513a932&session_id={SESSION_ID}&user_id={USER_ID}&requested_at=1751411711329&sign=dcb94c225e747bc5540d898e5f59ecaa69856d4e4f0ce5621cfea55c690e8773",
                    "destination_url": "lava-e-seca-midea-slim-healthguard-smart-mf201d110wb-wk-branca-com-14-programas-wi-fi-e-compativel-com-alexa-11kg/p/55069360",
                    "image_url": "https://imgs.casasbahia.com.br/55069360/1g.jpg",
                    "impression_url": "https://events.newtail-media.newtail.com.br/v1/beacon/impression/{AD_ID}?publisher_id={PUBLISHER_ID}&ad_type=sponsored_brand&campaign_id={CAMPAIGN_ID}&pname={PLACEMENT_NAME}&context=category&cat_term={CATEGORY_NAME}&product_sku=55069360&channel=site&event_id=0564df08-7cd7-463a-bc50-1bfc98529bde&request_id=bf0550d7-4ac0-4324-80af-5735e513a932&session_id={SESSION_ID}&user_id={USER_ID}&requested_at=1751411711329&sign=1cf5f705d813d0416801f6427f49f17e7b9614bd5f4db3be114029b7fa129580",
                    "product_metadata": {
                        "classificacaoMedia": "0",
                        "quantidadeAvaliacoes": "0"
                    },
                    "product_name": "Lava e Seca Midea Slim HealthGuard Smart MF201D110WB/WK Branca com 14 Programas, Wi-Fi e Compatível com Alexa – 11kg",
                    "product_sku": "55069360",
                    "seller_id": null,
                    "view_url": "https://events.newtail-media.newtail.com.br/v1/beacon/view/{AD_ID}?publisher_id={PUBLISHER_ID}&ad_type=sponsored_brand&campaign_id={CAMPAIGN_ID}&pname={PLACEMENT_NAME}&context=category&cat_term={CATEGORY_NAME}&product_sku=55069360&channel=site&event_id=0564df08-7cd7-463a-bc50-1bfc98529bde&request_id=bf0550d7-4ac0-4324-80af-5735e513a932&session_id={SESSION_ID}&user_id={USER_ID}&requested_at=1751411711329&sign=b04e75919077fe154adf88e54fa3191b57a5581743c1ed32543f4e745ca631c7"
                },
                {
                    "click_url": "https://events.newtail-media.newtail.com.br/v1/beacon/click/{AD_ID}?publisher_id={PUBLISHER_ID}&ad_type=sponsored_brand&campaign_id={CAMPAIGN_ID}&pname={PLACEMENT_NAME}&context=category&cat_term={CATEGORY_NAME}&product_sku=55049769&channel=site&event_id=86858352-3c9c-404c-9272-25c40961dd84&request_id=bf0550d7-4ac0-4324-80af-5735e513a932&session_id={SESSION_ID}&user_id={USER_ID}&requested_at=1751411711329&sign=5b234db80d0b76c384ac87cd2cc38d13c5dc9ae6aaff26805391d3d78392746e",
                    "destination_url": "lava-e-seca-midea-healthguard-smart-mf200d110wb-wk-branca-com-14-programas-e-wi-fi-11-7kg/p/55049769",
                    "image_url": "https://imgs.casasbahia.com.br/55049769/1g.jpg",
                    "impression_url": "https://events.newtail-media.newtail.com.br/v1/beacon/impression/{AD_ID}?publisher_id={PUBLISHER_ID}&ad_type=sponsored_brand&campaign_id={CAMPAIGN_ID}&pname={PLACEMENT_NAME}&context=category&cat_term={CATEGORY_NAME}&product_sku=55049769&channel=site&event_id=86858352-3c9c-404c-9272-25c40961dd84&request_id=bf0550d7-4ac0-4324-80af-5735e513a932&session_id={SESSION_ID}&user_id={USER_ID}&requested_at=1751411711329&sign=07f5b4ba7973897a387b16de1caba9a9c6d382d6d3971210851194726d651c98",
                    "product_metadata": {
                        "classificacaoMedia": "5",
                        "quantidadeAvaliacoes": "997"
                    },
                    "product_name": "Lava e Seca Midea HealthGuard Smart MF200D110WB/WK Branca com 14 Programas e Wi-Fi – 11/7kg",
                    "product_sku": "55049769",
                    "seller_id": null,
                    "view_url": "https://events.newtail-media.newtail.com.br/v1/beacon/view/{AD_ID}?publisher_id={PUBLISHER_ID}&ad_type=sponsored_brand&campaign_id={CAMPAIGN_ID}&pname={PLACEMENT_NAME}&context=category&cat_term={CATEGORY_NAME}&product_sku=55049769&channel=site&event_id=86858352-3c9c-404c-9272-25c40961dd84&request_id=bf0550d7-4ac0-4324-80af-5735e513a932&session_id={SESSION_ID}&user_id={USER_ID}&requested_at=1751411711329&sign=8b757f9fe6f548e0209b5c4ec33ea5bd96e264e99a3377245896c28d6387306b"
                }
            ],
            "seller_id": null,
            "type": "sponsored_brand",
            "view_url": "https://events.newtail-media.newtail.com.br/v1/beacon/view/{AD_ID}?publisher_id={PUBLISHER_ID}&ad_type=sponsored_brand&campaign_id={CAMPAIGN_ID}&pname={PLACEMENT_NAME}&context=category&cat_term={CATEGORY_NAME}&channel=site&event_id=ce740521-7075-4016-aa59-7248cdb0dc76&request_id=bf0550d7-4ac0-4324-80af-5735e513a932&session_id={SESSION_ID}&user_id={USER_ID}&requested_at=1751411711329&sign=8e4ca3a9d8661ff25de329246b5ad40369d03d9b3cc835cbfa6124a01039b5b1"
        }
    ]
}
```