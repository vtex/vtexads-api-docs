#!/bin/bash
# Generates a single unified markdown file (docs-full.md) from all PT documentation and examples.

OUTPUT="docs-full.md"

> "$OUTPUT"

append_file() {
  local file="$1"
  if [ -f "$file" ]; then
    echo "  Adding $file"
    # Remove relative image references (e.g. ![VTEX Ads Logo](../assets/...))
    sed '/!\[.*\](\.\.\/assets\//d' "$file" >> "$OUTPUT"
    echo "" >> "$OUTPUT"
    echo "---" >> "$OUTPUT"
    echo "" >> "$OUTPUT"
  else
    echo "  WARNING: $file not found, skipping"
  fi
}

echo "Building $OUTPUT..."

# ── Section 1: PT Documentation ──

echo ""
echo "Section 1: PT Documentation"

PT_DOCS=(
  "pt/docs/1-resumo.md"
  "pt/docs/2-glossario.md"
  "pt/docs/3-autenticacao.md"
  "pt/docs/4-seguranca-de-dados.md"
  "pt/docs/5-integracao-de-anuncios.md"
  "pt/docs/5.1-integracao-via-api.md"
  "pt/docs/5.2-integracao-vtex.md"
  "pt/docs/5.3-sincronizacao-de-catalogo.md"
  "pt/docs/5.4-integracao-de-audiencias.md"
  "pt/docs/5.5-consulta-de-anuncios.md"
  "pt/docs/5.5.1-recomendacao-de-nomes-de-placements.md"
  "pt/docs/5.6-eventos.md"
  "pt/docs/5.7-integracao-transparente.md"
  "pt/docs/6-exportacao-de-dados.md"
  "pt/docs/7-script-agent.md"
  "pt/docs/8-repasse.md"
  "pt/docs/9-sso.md"
  "pt/docs/10-janela-atribuicao.md"
)

for file in "${PT_DOCS[@]}"; do
  append_file "$file"
done

# ── Section 2: Examples ──

echo ""
echo "Section 2: Examples"

echo "# Exemplos" >> "$OUTPUT"
echo "" >> "$OUTPUT"
echo "---" >> "$OUTPUT"
echo "" >> "$OUTPUT"

EXAMPLES=(
  # Home
  "examples/HOME_BANNER_IMAGE.md"
  "examples/HOME_BANNER_VIDEO.md"
  "examples/HOME_SPONSORED_BRANDS_IMAGE.md"
  "examples/HOME_SPONSORED_BRANDS_VIDEO.md"
  "examples/HOME_SPONSORED_PRODUCTS.md"
  # Category
  "examples/CATEGORY_PAGE_BANNER_IMAGE.md"
  "examples/CATEGORY_PAGE_BANNER_VIDEO.md"
  "examples/CATEGORY_PAGE_SPONSORED_BRANDS_IMAGE.md"
  "examples/CATEGORY_PAGE_SPONSORED_BRANDS_VIDEO.md"
  "examples/CATEGORY_PAGE_SPONSORED_PRODUCTS.md"
  # Product
  "examples/PRODUCT_BANNER_IMAGE.md"
  "examples/PRODUCT_BANNER_VIDEO.md"
  "examples/PRODUCT_SPONSORED_BRANDS_IMAGE.md"
  "examples/PRODUCT_SPONSORED_BRANDS_VIDEO.md"
  "examples/PRODUCT_SPONSORED_PRODUCTS.md"
  # Search
  "examples/SEARCH_BANNER_IMAGE.md"
  "examples/SEARCH_BANNER_VIDEO.md"
  "examples/SEARCH_SPONSORED_BRANDS_IMAGE.md"
  "examples/SEARCH_SPONSORED_BRANDS_VIDEO.md"
  "examples/SEARCH_SPONSORED_PRODUCTS.md"
  # Digital Signage
  "examples/DIGITAL_SIGNAGE.md"
  # Events
  "examples/EVENTS_IMPRESSIONS_VIEWS_CLICKS_BROWSER.md"
  "examples/EVENTS_CONVERSION_BROWSER.md"
  "examples/EVENTS_CONVERSION_CURL.md"
  # Export
  "examples/EXPORT_ADS_DATA.md"
  "examples/EXPORT_ADVERTISER_DATA.md"
  "examples/EXPORT_CAMPAIGN_DATA.md"
  "examples/EXPORT_CAMPAIGNS_LIST_DATA.md"
  "examples/EXPORT_NETWORK_PUBLISHERS_DATA.md"
  "examples/EXPORT_PUBLISHER_DATA.md"
)

for file in "${EXAMPLES[@]}"; do
  append_file "$file"
done

echo ""
echo "Done! Output: $OUTPUT"
