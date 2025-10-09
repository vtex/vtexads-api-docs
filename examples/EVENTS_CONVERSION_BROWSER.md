# Conversion Event — Browser (Beacon + fetch)

This example shows how to send a conversion event from the browser. Prefer `navigator.sendBeacon` to avoid event loss when the user navigates away; fall back to `fetch` when Beacon is not available.

Endpoint (production):
- `POST https://events.newtail-media.newtail.com.br/v1/beacon/conversion`

## JavaScript (Browser)

```html
<script>
  async function sendConversion(order) {
    const payload = {
      channel: order.channel || 'ecommerce',
      publisher_id: order.publisherId,
      user_id: order.userId,
      session_id: order.sessionId,
      order_id: order.orderId,
      email_hashed: order.emailHashed,
      items: order.items.map(i => ({
        sku: i.sku,
        seller_id: i.sellerId || null,
        product_id: i.productId || null,
        quantity: i.quantity,
        price: i.unitPrice,
        promotional_price: i.unitPromotionalPrice
      })),
      created_at: order.createdAt || new Date().toISOString()
    };

    const url = 'https://events.newtail-media.newtail.com.br/v1/beacon/conversion';

    try {
      if (navigator.sendBeacon) {
        const blob = new Blob([JSON.stringify(payload)], { type: 'application/json' });
        const ok = navigator.sendBeacon(url, blob);
        if (!ok) {
          console.warn('Beacon failed, attempting fetch fallback');
          await fetch(url, {
            method: 'POST',
            headers: { 'Accept': 'application/json', 'Content-Type': 'application/json' },
            body: JSON.stringify(payload)
          });
        }
      } else {
        const resp = await fetch(url, {
          method: 'POST',
          headers: { 'Accept': 'application/json', 'Content-Type': 'application/json' },
          body: JSON.stringify(payload)
        });
        if (resp.status === 422) {
          const errors = await resp.json();
          console.error('Validation errors', errors);
        }
      }
    } catch (err) {
      console.error('Error sending conversion', err);
    }
  }

  // Example usage
  const exampleOrder = {
    channel: 'ecommerce',
    publisherId: 'xxx',
    userId: '6f92d1e9-00b6-4f8b-9645-faeab321e1cc',
    sessionId: '5898b8d1-c250-4bb5-931b-8b9d0ee7b499',
    orderId: '123',
    emailHashed: 'xyz',
    items: [
      { sku: '12221', sellerId: '1234', productId: '4567', quantity: 1, unitPrice: 2000.00, unitPromotionalPrice: 1899.00 },
      { sku: '12222', sellerId: null, productId: '4568', quantity: 2, unitPrice: 500.00, unitPromotionalPrice: 400.00 }
    ],
    createdAt: '2023-01-01T09:20:00Z'
  };
  // sendConversion(exampleOrder);
</script>
```
