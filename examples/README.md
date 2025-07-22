![VTEX Ads Logo](../assets/vtex-ads-logo.png)

# VTEX Ads API Examples

This directory contains examples of how to use the VTEX Ads API for different contexts and ad types. Each example includes sample request and response payloads.

## Organization

Examples are organized by context (where the ad appears) and ad type:

- **Context**: HOME, CATEGORY_PAGE, PRODUCT, SEARCH, DIGITAL_SIGNAGE
- **Ad Type**: BANNER, SPONSORED_BRANDS, SPONSORED_PRODUCTS
- **Media Type**: IMAGE, VIDEO (for BANNER and SPONSORED_BRANDS)

## Examples by Context

### Home Context

| Example | Description |
|---------|-------------|
| [HOME_BANNER_IMAGE](HOME_BANNER_IMAGE.md) | How to request banner image ads on the home page |
| [HOME_BANNER_VIDEO](HOME_BANNER_VIDEO.md) | How to request banner video ads on the home page |
| [HOME_SPONSORED_BRANDS_IMAGE](HOME_SPONSORED_BRANDS_IMAGE.md) | How to request sponsored brands with image on the home page |
| [HOME_SPONSORED_BRANDS_VIDEO](HOME_SPONSORED_BRANDS_VIDEO.md) | How to request sponsored brands with video on the home page |
| [HOME_SPONSORED_PRODUCTS](HOME_SPONSORED_PRODUCTS.md) | How to request sponsored product ads on the home page |

### Category Page Context

| Example | Description |
|---------|-------------|
| [CATEGORY_PAGE_BANNER_IMAGE](CATEGORY_PAGE_BANNER_IMAGE.md) | How to request banner image ads on category pages |
| [CATEGORY_PAGE_BANNER_VIDEO](CATEGORY_PAGE_BANNER_VIDEO.md) | How to request banner video ads on category pages |
| [CATEGORY_PAGE_SPONSORED_BRANDS_IMAGE](CATEGORY_PAGE_SPONSORED_BRANDS_IMAGE.md) | How to request sponsored brands with image on category pages |
| [CATEGORY_PAGE_SPONSORED_BRANDS_VIDEO](CATEGORY_PAGE_SPONSORED_BRANDS_VIDEO.md) | How to request sponsored brands with video on category pages |
| [CATEGORY_PAGE_SPONSORED_PRODUCTS](CATEGORY_PAGE_SPONSORED_PRODUCTS.md) | How to request sponsored product ads on category pages |

### Product Page Context

| Example | Description |
|---------|-------------|
| [PRODUCT_BANNER_IMAGE](PRODUCT_BANNER_IMAGE.md) | How to request banner image ads on product pages |
| [PRODUCT_BANNER_VIDEO](PRODUCT_BANNER_VIDEO.md) | How to request banner video ads on product pages |
| [PRODUCT_SPONSORED_BRANDS_IMAGE](PRODUCT_SPONSORED_BRANDS_IMAGE.md) | How to request sponsored brands with image on product pages |
| [PRODUCT_SPONSORED_BRANDS_VIDEO](PRODUCT_SPONSORED_BRANDS_VIDEO.md) | How to request sponsored brands with video on product pages |
| [PRODUCT_SPONSORED_PRODUCTS](PRODUCT_SPONSORED_PRODUCTS.md) | How to request sponsored product ads on product pages |

### Search Results Context

| Example | Description |
|---------|-------------|
| [SEARCH_BANNER_IMAGE](SEARCH_BANNER_IMAGE.md) | How to request banner image ads on search results pages |
| [SEARCH_BANNER_VIDEO](SEARCH_BANNER_VIDEO.md) | How to request banner video ads on search results pages |
| [SEARCH_SPONSORED_BRANDS_IMAGE](SEARCH_SPONSORED_BRANDS_IMAGE.md) | How to request sponsored brands with image on search results pages |
| [SEARCH_SPONSORED_BRANDS_VIDEO](SEARCH_SPONSORED_BRANDS_VIDEO.md) | How to request sponsored brands with video on search results pages |
| [SEARCH_SPONSORED_PRODUCTS](SEARCH_SPONSORED_PRODUCTS.md) | How to request sponsored product ads on search results pages |

### Digital Signage Context

| Example | Description |
|---------|-------------|
| [DIGITAL_SIGNAGE](DIGITAL_SIGNAGE.md) | How to request ads for digital signage (in-store displays) |

### Video

| Example                             | Description |
|-------------------------------------|-------------|
| [Video Player Browser Examples](VIDEOS_AUTOPLAY_BROWSER_EXAMPLE.html) | Example of autoplaying a video in a browser using HTML5 |

## Key Differences Between Examples

- **Context**: Different contexts require specific parameters (e.g., `product_sku` for product pages, `term` for search)
- **Ad Types**: Different ad types return different response structures
- **Media Types**: IMAGE vs VIDEO affects the request parameters and response format

For more detailed information about the API, refer to the [main documentation](../index.md).
