

# Exportação de Eventos

A exportação de dados agregados tem como objetivo fazer a integração dessas
informações de forma sistemática e periódica.

#

Conexão da Integração

Veja mais sobre a conexão em [Integração (Conexão)](/reference/integração-
conexão)

#

Formato de Integração

  * Os dados enviados serão sempre os dados d-1
  * O arquivo será em PARQUET (formato) + Snappy (compressão)
  * Os arquivos sempre serão enviados em um formato de path com dia. `TYPE_REPORT/YYYY/MM/DD/TIMESTAMP_NS/RANDOM_FILE_NAMES.snappy.parquet` (pode ser enviado 1 ou mais arquivos)

> ## 🚧
>
> De-duplicação de Eventos
>
> Existe a garantia que todos os eventos sempre serão enviados, porém não há
> garantia que o evento só será enviado uma única vez. Por tanto, os eventos
> precisam sempre ser de-duplicados.

#

Dados de Eventos

##

Impressões

Atributo| Tipo| Descrição  
---|---|---  
event_id| String| Identificador único do evento da conversão **(deduplication
key)**  
session_id| String| Identificador único da sessão do usuário  
user_id| String| Identificador único do usuário  
ad_id| String| Identificador do anúncio  
campaign_id| String| Identificador único da campanha  
request_id| String| Identificador único da requisição de consulta de anúncio  
ad_type| String| Tipo do anúncio que gerou a conversão  
placement_name| String| Nome do placement de onde o anúncio foi exibido  
context| String| Em qual contexto o anúncio foi exibido  
created_at| Timestamp UTC| Timestamp de quando o evento ocorreu  
site| String| Indica qual a marca do site  
  
##

Visualizações

Atributo| Tipo| Descrição  
---|---|---  
event_id| String| Identificador único do evento da conversão **(deduplication
key)**  
session_id| String| Identificador único da sessão do usuário  
user_id| String| Identificador único do usuário  
ad_id| String| Identificador do anúncio  
campaign_id| String| Identificador único da campanha  
request_id| String| Identificador único da requisição de consulta de anúncio  
ad_type| String| Tipo do anúncio que gerou a conversão  
placement_name| String| Nome do placement de onde o anúncio foi exibido  
context| String| Em qual contexto o anúncio foi exibido  
created_at| Timestamp UTC| Timestamp de quando o evento ocorreu  
site| String| Indica qual a marca do site  
  
##

Clicks

Atributo| Tipo| Descrição  
---|---|---  
event_id| String| Identificador único do evento da conversão **(deduplication
key)**  
session_id| String| Identificador único da sessão do usuário  
user_id| String| Identificador único do usuário  
ad_id| String| Identificador do anúncio  
campaign_id| String| Identificador único da campanha  
request_id| String| Identificador único da requisição de consulta de anúncio  
ad_type| String| Tipo do anúncio que gerou a conversão  
placement_name| String| Nome do placement de onde o anúncio foi exibido  
context| String| Em qual contexto o anúncio foi exibido  
created_at| Timestamp UTC| Timestamp de quando o evento ocorreu  
site| String| Indica qual a marca do site  
  
##

Conversões

Atributo| Tipo| Descrição  
---|---|---  
event_id| String| Identificador único do evento da conversão  
session_id| String| Identificador único da sessão do usuário  
user_id| String| Identificador único do usuário  
order_id| String| Identificador único do pedido no varejo **(deduplication
key)**  
channel| String| Identificador do canal  
placed_at| Timestamp UTC| Timestamp do pedido  
site| String| Indica qual a marca do site  
  
##

Itens das Conversões

Atributo| Tipo| Descrição  
---|---|---  
event_id| String| Identificador único do que gerou a conversão (view ou click)  
session_id| String| Identificador único da sessão do usuário  
user_id| String| Identificador único do usuário  
order_id| String| Identificador único do pedido no varejo **(deduplication
key)**  
product_sku| String| Identificador do produto **(deduplication key)**  
ad_id| String| Identificador único do anúncio  
campaign_id| String| Identificador único da campanha  
request_id| String| Identificador único da requisição de consulta de anúncio  
ad_size| String| O tamanho da mídia que foi utilizado no anúncio  
ad_type| String| Tipo do anúncio que gerou a conversão  
placement_name| String| Nome do placement de onde o anúncio foi exibido  
context| String| Em qual contexto o anúncio foi exibido  
event_created_at| timestamp| Timestamp de quando o evento aconteceu  
price| Float| Preço do produto (De)  
promotional_price| Float| Preço promocional do produto  
quantity| Int| Quantidade do item vendido  
total_value| Float| Valor total do item (quantity * min(price,
promotional_price))  
  
  * __Table of Contents
  *     * Conexão da Integração
    * Formato de Integração
    * Dados de Eventos
      * Impressões
      * Visualizações
      * Clicks
      * Conversões
      * Itens das Conversões

