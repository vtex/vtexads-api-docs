# Events — Browser (Impressions, Views, Clicks)

This example shows how to send impression, view, and click events from the browser using the Beacon API with a fetch fallback.

Important:
- Always use the exact event URLs (`impression_url`, `view_url`, `click_url`) returned by the ad query response for each ad. Do not derive them manually.
- `session_id` is required in all events; `user_id` is optional (recommended) when available.

## Helper Function

```html
<script>
  function sendEvent(eventUrl, sessionId, userId) {
    const payload = { session_id: sessionId };
    if (userId) payload.user_id = userId;

    if (navigator.sendBeacon) {
      const blob = new Blob([JSON.stringify(payload)], { type: 'application/json' });
      const ok = navigator.sendBeacon(eventUrl, blob);
      if (!ok) {
        console.warn('Beacon failed, attempting fetch fallback');
        fetch(eventUrl, {
          method: 'POST',
          headers: { 'Content-Type': 'application/json', 'Accept': 'application/json' },
          body: JSON.stringify(payload)
        }).catch(err => console.error('Fetch fallback failed', err));
      }
    } else {
      fetch(eventUrl, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json', 'Accept': 'application/json' },
        body: JSON.stringify(payload)
      }).catch(err => console.error('Fetch failed', err));
    }
  }
</script>
```

## Usage Example

```html
<script>
  // Replace these with the URLs returned by the ad query for a specific ad
  const impressionUrl = 'https://events.newtail-media.newtail.com.br/v1/beacon/impression/{AD_EVENT_TOKEN}';
  const viewUrl       = 'https://events.newtail-media.newtail.com.br/v1/beacon/view/{AD_EVENT_TOKEN}';
  const clickUrl      = 'https://events.newtail-media.newtail.com.br/v1/beacon/click/{AD_EVENT_TOKEN}';

  const sessionId = '{SESSION_ID}';
  const userId = '{USER_ID}'; // optional

  // When the ad is rendered
  sendEvent(impressionUrl, sessionId, userId);

  // When the ad is visible (if you measure viewability)
  // e.g., triggered by an IntersectionObserver callback
  sendEvent(viewUrl, sessionId, userId);

  // On user click
  // e.g., inside an onClick handler
  sendEvent(clickUrl, sessionId, userId);
</script>
```
