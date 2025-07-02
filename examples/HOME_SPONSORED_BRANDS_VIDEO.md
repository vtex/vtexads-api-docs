# Sponsored Brands (Video) - Home Context

This example demonstrates how to request sponsored brand ads with video assets in the home context.

## Request

```bash
curl --location 'https://newtail-media.newtail.com.br/v1/rma/{PUBLISHER_ID}' \
--header 'Content-Type: application/json' \
--data '{
    "context": "category",
    "category_name": "Bebidas",
    "channel": "site",
    "placements": {
        "{PLACEMENT_NAME}": {
            "quantity": 1,
            "assets_type": [ "video" ],
            "types": [
                "sponsored_brand"
            ],
            "size": "{ASSET_SIZE}"
        }
    },
    "session_id": "{SESSION_ID}"
}'
```

## Response

```json
{
    "query_at": "2025-07-01T23:33:48.948167020+00:00",
    "query_id": "d2fa688e-41ee-4cfa-a064-e109f018774a",
    "request_id": "decf86b9-53ca-48b4-9d47-612b2e149bbd",
    "{PLACEMENT_NAME}": [
        {
            "ad_id": "{AD_ID}",
            "asset_type": "video",
            "assets": [
                {
                    "dimension": "1920x1080",
                    "type": "video",
                    "url": "https://https://cdn.newtail.com.br/retail_media/ads-video/2025/02/18/a8d374aec2a7a14c163fff66d59acf79.mp4"
                }
            ],
            "brand_name": "",
            "brand_url": "https://cdn.newtail.com.br/retail_media/ads-video/2025/02/18/a8d374aec2a7a14c163fff66d59acf79.mp4",
            "campaign_name": "[TEST] VIDEO SPONSORED BRAND CAMPAIGN",
            "click_url": "https://events.newtail-media.newtail.com.br/v1/beacon/click/{AD_ID}?publisher_id={PUBLISHER_ID}&ad_type=sponsored_brand_video&campaign_id={CAMPAIGN_ID}&pname={PLACEMENT_NAME}&ad_size=1920x1080&context=category&cat_term=Bebidas&channel=site&event_id=0742419b-edd0-4c30-94b6-46bdb05cf4dc&request_id=decf86b9-53ca-48b4-9d47-612b2e149bbd&session_id={SESSION_ID}&requested_at=1751412851039&sign=b25f67a6ee423e760e1c799c041f98e70def115f6e49d974579580e2fed7ac4d",
            "description": "t2",
            "destination_url": "www.google.com",
            "headline": "t1",
            "impression_url": "https://events.newtail-media.newtail.com.br/v1/beacon/impression/{AD_ID}?publisher_id={PUBLISHER_ID}&ad_type=sponsored_brand_video&campaign_id={CAMPAIGN_ID}&pname={PLACEMENT_NAME}&ad_size=1920x1080&context=category&cat_term=Bebidas&channel=site&event_id=0742419b-edd0-4c30-94b6-46bdb05cf4dc&request_id=decf86b9-53ca-48b4-9d47-612b2e149bbd&session_id={SESSION_ID}&requested_at=1751412851039&sign=65d8fe3d3bea794f6b2ed468a5f28fce24a3802e84925e2fa4ea8c5d0f82be0e",
            "position": 0,
            "products": [
                {
                    "click_url": "https://events.newtail-media.newtail.com.br/v1/beacon/click/{AD_ID}?publisher_id={PUBLISHER_ID}&ad_type=sponsored_brand_video&campaign_id={CAMPAIGN_ID}&pname={PLACEMENT_NAME}&ad_size=1920x1080&context=category&product_sku=1570478459&cat_term=Bebidas&channel=site&event_id=a9dd831d-5bb0-4b7d-b169-c84ca7317625&request_id=decf86b9-53ca-48b4-9d47-612b2e149bbd&session_id={SESSION_ID}&requested_at=1751412851039&sign=d661271fd4a3bb9aa279ceaeb84a196b38f8c87e52a714b67261d66b2131d2a3",
                    "destination_url": "pneu-wanli-sp203-175-75r13-aro-13-84t-kit4/p/1570478459",
                    "image_url": "https://imgs.extra.com.br/1570478459/1xg.jpg",
                    "impression_url": "https://events.newtail-media.newtail.com.br/v1/beacon/impression/{AD_ID}?publisher_id={PUBLISHER_ID}&ad_type=sponsored_brand_video&campaign_id={CAMPAIGN_ID}&pname={PLACEMENT_NAME}&ad_size=1920x1080&context=category&product_sku=1570478459&cat_term=Bebidas&channel=site&event_id=a9dd831d-5bb0-4b7d-b169-c84ca7317625&request_id=decf86b9-53ca-48b4-9d47-612b2e149bbd&session_id={SESSION_ID}&requested_at=1751412851039&sign=2e6288803dd2b1138e1e24ce69decbee5a13ac3ad0f3a60afcd29d68589088ac",
                    "product_metadata": {
                        "classificacaoMedia": "0",
                        "quantidadeAvaliacoes": "0"
                    },
                    "product_name": "Pneu Wanli SP203 175/75R13 Aro 13 84T Kit4",
                    "product_sku": "1570478459",
                    "seller_id": null,
                    "view_url": "https://events.newtail-media.newtail.com.br/v1/beacon/view/{AD_ID}?publisher_id={PUBLISHER_ID}&ad_type=sponsored_brand_video&campaign_id={CAMPAIGN_ID}&pname={PLACEMENT_NAME}&ad_size=1920x1080&context=category&product_sku=1570478459&cat_term=Bebidas&channel=site&event_id=a9dd831d-5bb0-4b7d-b169-c84ca7317625&request_id=decf86b9-53ca-48b4-9d47-612b2e149bbd&session_id={SESSION_ID}&requested_at=1751412851039&sign=f94a73f9f5c78e01369f8bd6c2db08a1e09d26d22d4cc01a926a892ac5107b3c"
                }
            ],
            "seller_id": null,
            "type": "sponsored_brand",
            "view_url": "https://events.newtail-media.newtail.com.br/v1/beacon/view/{AD_ID}?publisher_id={PUBLISHER_ID}&ad_type=sponsored_brand_video&campaign_id={CAMPAIGN_ID}&pname={PLACEMENT_NAME}&ad_size=1920x1080&context=category&cat_term=Bebidas&channel=site&event_id=0742419b-edd0-4c30-94b6-46bdb05cf4dc&request_id=decf86b9-53ca-48b4-9d47-612b2e149bbd&session_id={SESSION_ID}&requested_at=1751412851039&sign=a4a316c7b040ced01da9371e970ce604e60b9cb15679e5ab5074026462ec7ace"
        }
    ]
}
```