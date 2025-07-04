## 5. Exportação de Dados

A exportação de dados permite que você receba informações detalhadas sobre eventos e dados agregados de forma sistemática e periódica. A integração ocorre através de uma conexão S3, e os dados são entregues em formatos específicos para cada tipo de exportação.

### Conexão da Integração

A integração sempre ocorrerá usando uma conexão S3 (ou compatível) que deverá ser disponibilizada pelo receptor dos dados. As credenciais devem ser passadas para o time da Newtail de forma segura.

A integração é compatível com:

*   **AWS S3:** `Access Key Id` e `Access Key Secret`.
*   **Google Cloud Storage:** `Service Account`.
*   **Azure Blob Storage**.

### Exportação de Eventos

A exportação de eventos envia dados brutos de interações dos usuários.

*   **Formato:** `PARQUET` com compressão `Snappy`.
*   **Frequência:** Diária (dados de D-1).
*   **Estrutura de Pastas:** `TYPE_REPORT/YYYY/MM/DD/TIMESTAMP_NS/RANDOM_FILE_NAMES.snappy.parquet`
*   **De-duplicação:** É garantido que todos os eventos serão enviados, mas não que serão enviados uma única vez. Portanto, os eventos precisam sempre ser de-duplicados usando a `event_id` ou a combinação de `order_id` e `product_sku` para itens de conversão.

#### Tipos de Eventos

*   **Impressões, Visualizações e Cliques:**
    *   **Campos:** `event_id` (chave de de-duplicação), `session_id`, `user_id`, `ad_id`, `campaign_id`, `request_id`, `ad_type`, `placement_name`, `context`, `created_at`, `site`.
*   **Conversões:**
    *   **Campos:** `event_id`, `session_id`, `user_id`, `order_id` (chave de de-duplicação), `channel`, `placed_at`, `site`.
*   **Itens das Conversões:**
    *   **Campos:** `event_id`, `session_id`, `user_id`, `order_id` (chave de de-duplicação), `product_sku` (chave de de-duplicação), `ad_id`, `campaign_id`, `request_id`, `ad_size`, `ad_type`, `placement_name`, `context`, `event_created_at`, `price`, `promotional_price`, `quantity`, `total_value`.

### Exportação de Dados Agregados

A exportação de dados agregados envia relatórios consolidados.

*   **Formato:** `CSV` com encoding `UTF-8`, separado por vírgula, e números no formato americano (ponto decimal).
*   **Frequência:** Diária (dados de D-1, com o timezone do publisher).
*   **Estrutura de Pastas:** `TYPE_REPORT/YYYY/MM/DD/TIMESTAMP_NS/RANDOM_FILE_NAMES.csv`

#### Tipos de Relatórios

*   **Anunciantes:**
    *   **Campos:** `advertiser`, `advertiser_id`, `seller_id`, `wallet_balance`, `daily_budget`, `currency`.
*   **Campanhas:**
    *   **Campos:** `day`, `name`, `campaign_id`, `campaign_type`, `campaign_status`, `impressions_total`, `clicks_total`, `ctr`, `ad_revenue`, `conversions_total`, `conversion_rate`, `sales_revenue`, `start_date`, `end_date`, `advertiser_id`.
*   **Anúncios:**
    *   **Campos:** `day`, `ad_id`, `campaign_id`, `ad_status`, `ad_media_url`, `cpm`, `cpc`, `impressions_total`, `clicks_total`, `ctr`, `ad_revenue`, `conversions_total`, `conversion_rate`, `sales_revenue`, `product_sku`.

### Exportação de Relatórios via API

Além da exportação via S3, é possível extrair relatórios via API. As rotas retornam JSON por padrão, mas podem ser exportadas como arquivos XLSX ao incluir o parâmetro `download=true` na query.

*   `GET /report/v2/advertisers`: Informações de anunciantes (visão do publisher).
*   `GET /report/v2/publishers`: Informações do publisher (visão do anunciante).
*   `GET /report/network/publishers`: Publishers da rede (para contas do tipo Rede).
*   `GET /campaign/v2`: Relatório de campanhas.
*   `GET /ad/results/v2`: Relatório de anúncios.