# BANNER VIDEO - Home Context

This example demonstrates how to request banner video ads in the home context.

## Request

```bash
curl --location 'https://newtail-media.newtail.com.br/v1/rma/{PUBLISHER_ID}' \
--header 'Accept-Encoding: deflate' \
--header 'Content-Type: application/json' \
--data '{
    "context": "home",
    "channel": "site",
    "user_id": "{USER_ID}",
    "session_id": "{SESSION_ID}",
    "placements": {
        "{PLACEMENT_NAME}": { "quantity": 1, "types": ["banner"], "size": "{ASSET_SIZE}", "assets_type": ["video"] }
    }
}'
```

## Response

```json
{
  "query_at": "2025-07-01T23:52:26.019033882+00:00",
  "query_id": "8aa8841c-ad5b-4f53-997e-5d39cd47e946",
  "request_id": "ee77f3fa-8eb8-4121-92f3-715eb70fd337",
  "{PLACEMENT_NAME}": [
    {
      "ad_id": "{AD_ID}",
      "asset_type": "video",
      "campaign_name": "{CAMPAIGN_NAME}",
      "click_url": "https://events.newtail-media.newtail.com.br/v1/beacon/click/{AD_ID}?publisher_id={PUBLISHER_ID}&ad_type=banner_video&campaign_id={CAMPAIGN_ID}&pname={PLACEMENT_NAME}&ad_size=1920x1080&context=category&cat_term=HOME&event_id=b1d1eae8-8fe0-4f41-bfe3-2b8cf60b90c3&request_id=ee77f3fa-8eb8-4121-92f3-715eb70fd337&session_id={}&requested_at=1751413946019&sign=9c7471aaf64b18b0d8b2c62295e0b97674299bcd4addcd6edaf32889906adefd",
      "destination_url": null,
      "impression_url": "https://events.newtail-media.newtail.com.br/v1/beacon/impression/{AD_ID}?publisher_id={PUBLISHER_ID}&ad_type=banner_video&campaign_id={CAMPAIGN_ID}&pname={PLACEMENT_NAME}&ad_size=1920x1080&context=category&cat_term=HOME&event_id=b1d1eae8-8fe0-4f41-bfe3-2b8cf60b90c3&request_id=ee77f3fa-8eb8-4121-92f3-715eb70fd337&session_id={}&requested_at=1751413946019&sign=e0ccbf3dfb03718bc0a3af31ade817135429c8fc80be032e3b7e0f1a0de3a55b",
      "media_url": "https://cdn2.newtail.com.br/retail_media/ads-video/2025/02/18/a8d374aec2a7a14c163fff66d59acf79.mp4",
      "position": 0,
      "seller_id": null,
      "type": "banner",
      "view_url": "https://events.newtail-media.newtail.com.br/v1/beacon/view/{AD_ID}?publisher_id={PUBLISHER_ID}&ad_type=banner_video&campaign_id={CAMPAIGN_ID}&pname={PLACEMENT_NAME}&ad_size=1920x1080&context=category&cat_term=HOME&event_id=b1d1eae8-8fe0-4f41-bfe3-2b8cf60b90c3&request_id=ee77f3fa-8eb8-4121-92f3-715eb70fd337&session_id={}&requested_at=1751413946019&sign=3eb6d5121c175d044401b27889766d06b402ba6271bf4990cf3fd3f250f50b4f"
    }
  ]
}
```