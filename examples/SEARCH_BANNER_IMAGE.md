# BANNER IMAGE - Search Context

This example demonstrates how to request banner ads in the search context.

## Request

```bash
curl --location 'https://newtail-media.newtail.com.br/v1/rma/{PUBLISHER_ID}' \
--header 'Accept-Encoding: deflate' \
--header 'Content-Type: application/json' \
--data '{
    "context": "search",
    "term": "{TERM}",
    "channel": "site",
    "user_id": "{USER_ID}",
    "session_id": "{SESSION_ID}",
    "placements": {
        "{PLACEMENT_NAME}": { "quantity": 1, "types": ["banner"], "size": "{ASSET_SIZE}" }
    }
}'
```

## Response

```json
{
    "{PLACEMENT_NAME}": [
        {
            "ad_id": "{AD_ID}",
            "asset_type": "image",
            "campaign_name": "{CAMPAIGN_NAME}",
            "click_url": "https://events.newtail-media.newtail.com.br/v1/beacon/click/{AD_ID}?publisher_id={PUBLISHER_ID}&ad_type=banner&campaign_id={CAMPAIGN_ID}&pname=displays&ad_size={ASSET_SIZE}&context=search&search_term={SEARCH_TERM}&channel=site&event_id=199981cc-0266-491c-8ece-d5443068b19b&request_id=bd996431-5057-4fb2-a0e9-d8af84b23fde&session_id={SESSION_ID}&user_id={USER_ID}&requested_at=1751413372239&sign=6248131ddfaa5b8553c1ed9d78fdec5923a53f201973ea2f23879d084d2ffbcb",
            "destination_url": null,
            "impression_url": "https://events.newtail-media.newtail.com.br/v1/beacon/impression/{AD_ID}?publisher_id={PUBLISHER_ID}&ad_type=banner&campaign_id={CAMPAIGN_ID}&pname=displays&ad_size={ASSET_SIZE}&context=search&search_term={SEARCH_TERM}&channel=site&event_id=199981cc-0266-491c-8ece-d5443068b19b&request_id=bd996431-5057-4fb2-a0e9-d8af84b23fde&session_id={SESSION_ID}&user_id={USER_ID}&requested_at=1751413372239&sign=05d843a6094f22a4dd14ffc9e0e8d86d2363f81766fa91561e669e5044e09eb2",
            "media_url": "https://cdn2.newtail.com.br/retail_media/ads/2025/06/27/f45c51e4beb4e87f9e4fc2a1d6c133b9.jpeg",
            "position": 0,
            "products": [
                {
                    "product_sku": "7896024760883"
                }
            ],
            "seller_id": null,
            "type": "banner",
            "view_url": "https://events.newtail-media.newtail.com.br/v1/beacon/view/{AD_ID}?publisher_id={PUBLISHER_ID}&ad_type=banner&campaign_id={CAMPAIGN_ID}&pname=displays&ad_size={ASSET_SIZE}&context=search&search_term={SEARCH_TERM}&channel=site&event_id=199981cc-0266-491c-8ece-d5443068b19b&request_id=bd996431-5057-4fb2-a0e9-d8af84b23fde&session_id={SESSION_ID}&user_id={USER_ID}&requested_at=1751413372239&sign=352034b8bc9b5a1a19594ecfc933a658c9776a446b9460badc5ebe4eb5a3b36f"
        }
    ],
    "query_at": "2025-07-01T23:42:52.239148571+00:00",
    "query_id": "691e741a-d291-4611-8259-42a1830796e3",
    "request_id": "bd996431-5057-4fb2-a0e9-d8af84b23fde"
}
```