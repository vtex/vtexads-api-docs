# BANNER IMAGE - Digital Signage Context

This example demonstrates how to request banner ads in the digital signage context.

## Request

```bash
curl --location 'https://newtail-media.newtail.com.br/v1/rma/{PUBLISHER_ID}' \
--header 'Accept-Encoding: deflate' \
--header 'Content-Type: application/json' \
--data '{
    "context": "digital_signage",
    "channel": "in-store",
    "user_id": "{USER_ID}",
    "session_id": "{SESSION_ID}",
    "device_id": "{DEVICE_ID}",
    "store_name": "{STORE_NAME}",
    "placements": {
        "{PLACEMENT_NAME}": { "quantity": 1, "types": ["banner"], "size": "{ASSET_SIZE}" }
    },
    "segmentation": [
        {
            "key": "STATE",
            "values": [
                "RJ"
            ]
        },
        {
            "key": "CITY",
            "values": [
                "Rio de Janeiro"
            ]
        },
        {
            "key": "NEIGHBOURHOOD",
            "values": [
                "Cascadura",
                "Madureira"
            ]
        }
    ]
}'
```

## Response

```json
{
    "{PLACEMENT_NAME}": [
        {
          "type": "digital_signage"
          "impression_url": "https://events.newtail-media.newtail.com.br/v1/beacon/impression/{AD_ID}?publisher_id={PUBLISHER_ID}&ad_type=banner&campaign_id={CAMPAIGN_ID}&pname=displays&ad_size={ASSET_SIZE}&context=digital_signage&channel=pos&event_id=199981cc-0266-491c-8ece-d5443068b19b&request_id=bd996431-5057-4fb2-a0e9-d8af84b23fde&session_id={SESSION_ID}&user_id={USER_ID}&requested_at=1751413372239&sign=05d843a6094f22a4dd14ffc9e0e8d86d2363f81766fa91561e669e5044e09eb2",
          "assets": [
            {
              "type": "image|video",
              "url": "URL da imagem",
              "duration": 30
            }
          ]
        }
    ],
    "query_at": "2025-07-01T23:42:52.239148571+00:00",
    "query_id": "691e741a-d291-4611-8259-42a1830796e3",
    "request_id": "bd996431-5057-4fb2-a0e9-d8af84b23fde"
}
```