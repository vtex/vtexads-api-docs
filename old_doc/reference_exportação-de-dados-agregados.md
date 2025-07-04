

# Exportação de Dados Agregados

A exportação de dados agregados tem como objetivo fazer a integração dessas
informações de forma sistemática e periódica.

#

Conexão da Integração

Veja mais sobre a conexão em [Integração (Conexão)](/reference/integração-
conexão)

#

Formato da Integração

  * Os dados enviados serão sempre os dados d-1
  * Os dados serão sempre enviados d-1 com o timezone do publisher.
  * O formado de envio será em CSV 
    * encoding UTF-8
    * separação por "vírgula"
    * todos os números seguiram o formato americano com decimal sendo ponto (".")
  * Os arquivos sempre serão enviados em um formato de path com dia. `TYPE_REPORT/YYYY/MM/DD/TIMESTAMP_NS/RANDOM_FILE_NAMES.csv` (pode ser enviado 1 ou mais arquivos)

#

Dados que serão enviados

> ## 📘
>
> File Examples
>
> Exemplos de arquivos que serão enviados
>
> <https://cdn.newtail.com.br/retail-media/docs/export-reports/ads.csv>  
>  <https://cdn.newtail.com.br/retail-media/docs/export-reports/campaigns.csv>  
>  <https://cdn.newtail.com.br/retail-media/docs/export-
> reports/advertisers.csv>

**Anunciantes**

` /YYYY/MM/DD/CURRENT_DELIVERY_TIME/RANDOM_FILE_NAME.csv`

Coluna| Tipo| Descrição  
---|---|---  
advertiser| String| Indica o nome do anunciante  
advertiser_id| String| Identificador único do anunciante  
seller_id| String| Identificador do seller  
wallet_balance| Float| Valor atual na carteira do anunciante  
daily_budget| Float| Soma total do daily budget de todas as campanhas ativas  
currency| String| Formato da moeda que o anunciante está operando.  
ex.: BRL, USD, etc...  
  
**Campanhas**

`campaigns/YYYY/MM/DD/CURRENT_DELIVERY_TIME/RANDOM_FILE_NAME.csv`

Coluna| Tipo| Descrição  
---|---|---  
day| date YYYY-DD-MM| O dia sempre é enviado no timezone do publisher  
name| String| Nome da Campanha  
campaign_id| String| Identificador único da campanha  
campaign_type| String| Tipo de Campanha  
  
\- product  
\- banner  
\- sponsored_brands  
\- video  
campaign_status| String| Indica em qual status a campanha está operando  
impressions_total| int| Total de Impressões  
clicks_total| int| Total de Clicks  
ctr| float| CTR da campanha  
ad_revenue| Float| Receita com Ads  
conversions_total| int| Total de conversões  
conversion_rate| float| Taxa de Conversão dos pedidos  
sales_revenue| float| Receita com os itens vendidos  
start_date| date YYYY-DD-MM| Quando a campanha inicia  
end_date| date YYYY-DD-MM| Quando a campanha termina  
advertiser_id| String| Identificador único do anunciante  
  
  

**Anúncios**

`ads/YYYY/MM/DD/CURRENT_DELIVERY_TIME/RANDOM_FILE_NAME.csv`

Coluna| Tipo| Descrição  
---|---|---  
day| date YYYY-DD-MM| O dia sempre é enviado no timezone do publisher  
ad_id| String| Identificador único do ad  
campaign_id| String| Identificador único da campanha  
ad_status| String| Indica em qual status a campanha está operando  
ad_media_url| String| URL da mídia do anúncio  
cpm| float| Valor do CPM  
cpc| float| valor do CPC  
impressions_total| int| total de impressões  
clicks_total| int| total de clicks  
ctr| float| ctr do anúncio  
ad_revenue| float| receita com o anúncio  
conversions_total| int| total de conversões geradas pelo anúncio  
conversion_rate| float| taxa de conversão  
sales_revenue| float| receita com a venda dos produtos  
product_sku| String| Lista de Skus separdo por ponto e vírgula.  
Obs.: Campanhas de produto sempre possuem apenas 1 produto por anúncio  
  
  

**Anúncios de produtos**

`ads/YYYY/MM/DD/CURRENT_DELIVERY_TIME/RANDOM_FILE_NAME.csv`

Coluna| Tipo| Descrição  
---|---|---  
day| date YYYY-DD-MM| O dia sempre é enviado no timezone do publisher  
ad_id| String| Identificador único do ad  
campaign_id| String| Identificador único da campanha  
advertiser_id| String| Identificador único do anunciante  
product_sku| String| Sku do produto  
ad_type| String| Tipo do anúncio  
ad_media_url| String| URL da mídia do anúncio  
cpm| float| Valor do CPM  
cpc| float| valor do CPC  
impressions_total| int| total de impressões  
clicks_total| int| total de clicks  
ctr| float| ctr do anúncio  
ad_revenue| float| receita com o anúncio  
conversions_total| int| total de conversões geradas pelo anúncio  
conversion_rate| float| taxa de conversão  
sales_revenue| float| receita com a venda dos produtos  
  
  

**Catálogo**

`catalog/YYYY/MM/DD/CURRENT_DELIVERY_TIME/RANDOM_FILE_NAME.csv`

Coluna| Tipo| Descrição  
---|---|---  
product_sku| String| Indica o SKU do produto  
name| String| Nome do Produto  
categories| String| Lista de categorias do produto separadas por ponto e
vírgula.  
  
Ex.: Cat1 > Cat2; ...  
image_url| String| URL da imagem do produto  
  
  *  __Table of Contents
  *     * Conexão da Integração
    * Formato da Integração
    * Dados que serão enviados

