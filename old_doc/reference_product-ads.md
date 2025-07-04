# Consultar Anúncios

#

Informações básicas

Essa API poderá retornar tanto os formatos de Produtos e Banners, possuindo a
mesma interface de consulta.

A tabela abaixo descreve quais campos são obrigatórios e quais são opcionais
nessa operação:

Campo| Descrição| Tipo| Obrigatoriedade  
---|---|---|---  
session_id| Identificador único da sessão de um usuário.  
  
**Deve conter apenas valores alfa-numéricos**|  String| Sim  
user_id| Identificador único do usuário  
  
**Deve conter apenas valores alfa-numéricos**|  String| Não  
store_id| Permite filtrar o resultado dos anúncios com base no estoque da
loja.  
  
**Caso o store_id não seja informado, o anúncio com qualquer estoque
disponível será retornado**|  String| Não  
channel| Indica por qual dispositivo o cliente está acessando.  
  
Ex.:  
  
\- site  
\- msite  
\- app| String| Sim  
context| Contexto onde será exibido o anúncio. Exemplo: home, category,
search, product_page, brand_page| String| Sim  
term| Termos utilizados na busca de produtos.| String| Somente no contexto
search  
category_name| Nome da category a ser utilizada como segmentação  
  
Sempre deve enviar o breadcrumb completo da categoria atual.  
  
Ex.: Cuidado Diário > Desodorante > Spray  
  
1º nível: Cuidado Diário  
2º nível: Desodorante  
3º nível: Spray| String| Somente no contexto category  
product_sku| Id do sku a ser utilizado como segmentação| String| Somente no
contexto de product  
brand_name| O nome da marca que os produtos devem ser filtrados| String|
Somente no contexto de brand  
placements| Placements são utilizados para consultar de forma específica
diversos anúncios para regiões diferentes do site com configurações próprias|
Object| Sim  
placements.{name}| O name indica o nome da região do site e esse nome para ser
qualquer um da escolha do usuário da api. Pois o resultado usará esse nome na
resposta.| Object| Sim  
placements.{name}.quantity| Indica a quantidade de anúncios que deve ser
retornando| Integer| Sim  
placements.{name}.size| Indica o tamanho do Anúncio esperado. Essa informação
é importante quando uma região tem um tamanho pré-definido e precisa de uma
média que se enquadre no tamanho específico.  
Esses tamanhos variam de acordo com o publisher.| String| Sim  
placements.{name}.types| Indica quais tipos de Anúncios podem ser retornado na
requisição específica.  
Opções:  
  
\- product  
\- banner  
\- sponsored_brand  
\- digital_signage [Digital Signage](/reference/digital-signage)|
Array<String>| Sim  
placements.{name}.assets_type| Tipo de Média que aceita.  
(válido para banner e sponsored_brands)  
  
\- image  
\- video| Array<String>| Não  
Padão: ["image"]  
placements.{name}.allow_sku_duplications| Permite que anúncios de mesmo SKU
possam ser retornados para um mesmo placement.  
  
default=false| Boolean| Não  
product_attributes| Indica informações extras do produto.  
  
Quando a informação do catálogo está incompleta, existe a necessidade de
enviar essas informações durante a consulta do anúncio.| Object| Não  
product_attributes.category_name| Indica a category do produto.  
  
Ex.: Cuidado Diário > Desodorante > Spray  
  
1º nível: Cuidado Diário  
2º nível: Desodorante  
3º nível: Spray| String| Não  
product_attributes.brand_name| Indica qual a categoria do produto  
  
Ex.: iphone| String| Não  
device_id| Identifica unicamente um dispositivo| String| obrigatório para
digital signage  
userAgent| o user agent indica meta informações sobre como é o ambiente que o
cliente está usando para acessar o anúncio.  
  
Para navegadores, podemos usar o user-agent gerador pelo navegador.  
Que pode ser obtido de duas formas:  
  
\- no navegador: navigator.userAgent  
\- no header da requisição: user-agentPara outros dispositivos (ex.: App) o
ideal será montar esse user-agent.Formato: App/1.0 ({Dispositivo}; {Sistema
Operacional} {Versão};)Ex.:  
App/1.0 (Pixel 6; Android 12.0)  
App/1.0 (iPhone 12; iOS 15.0)  
App/1.0 (iPad X; iOS 17.0)| String| Não  
tags| Filtra os anúncios que possuem ao menos uma das tags da requisição.  
  
**só funciona com campanhas de produtos**  
  
Integração com VTEX que usam Intelligent Search possui as tags automáticas dos
clusters de produtos. Formato `product_cluster/:id_cluster`| Array<String>|
Não  
skus| Filtro de SKUs para consulta de produtos patrocinados.  
  
Obs.: Apenas campanha de **produtos patrocinados** respeitam esse filtro|
Array<String>| Não  
dedup_campaign_ads| Define se os resultados devem ser deduplicados por
campanha. Ou seja, a resposta conterá no máximo um anúncio por campanha.  
  
Default=false| Boolean| Não  
dedup_ads| Define se os resultados devem ser deduplicados os ads em multiplos
placements (usar apenas quando consultar multiplos placements ao menos tempo)  
  
Default=false| Boolean| Não  
segmentation| Permite a segmentação de campanhas com base nas informações do
usuário  
  
Veja mais em [Segmentação de Campanhas](/reference/segmentação-de-campanhas)  
  
Essa informação é útil quando:  
  
\- O usuário não estar logado  
\- Não existe integração com informações de segmentação  
\- Deseja sobrescrever as informações de segmentação do usuário|
Array<Object>| Não  
segmentation.#.key| Indica o tipo de segmentação  
  
Valores possíveis:  
  
\- AGE  
\- GENDER  
\- STATE  
\- CITY  
\- AUDIENCES| String| Sim  
segmentation.#.values| Indica um ou mais valores que aceitáveis.|
Array<String>| Sim (min 1)  
  
##

Campos da Resposta de Consulta de Anúncios

A resposta será um dicionário onde cada chave é o nome de um placement
utilizado na consulta.

Campo| Descrição| Tipo| Obrigatório  
---|---|---|---  
{placementName}| Lista de Anúncios que podem ser exibidos no placement
específico| Array| Sim  
{placementName}.#.ad_id| Identificação única do anúncio| String| Sim  
{placementName}.#.asset_dimension| Define o tamanho da image/video que será
retornado.  
  
Em formato WxH| String| Não  
{placementName}.#.asset_type| Tipo da média  
  
\- image  
\- video| String| Sim  
{placementName}.#.media_url| URL da imagem que deve ser exibida| String| Sim  
{placementName}.#.destination_url| URL de destino do anúncio (nem todo anúncio
possui um destino)| String| Não  
{placementName}.#.type| Tipo do anúncio  
  
\- banner  
\- product  
\- sponsored_brands| String| Sim  
{placementName}.#.click_url| URL do beacon de evento do clique do anúncio|
String| Sim  
{placementName}.#.impression_url| URL do beacon de evento do Impressão do
anúncio| String| Sim  
{placementName}.#.view_url| URL do beacon de evento do Visualização do
anúncio| String| Sim  
{placementName}.#.seller_id| Identificador do seller| String| Não  
{placementName}.#.product_sku| Identificador do Produto| String| Sim (quando o
anúncio for do tipo product)  
{placementName}.#.product_name| Nome do Produto| String| Sim (quando o anúncio
for do tipo product)  
  
Exemplo de Retorno:

json

    
    
    {
        "nomeDoPlacement1": [
            {
                "ad_id": "8771ebf0-ca93-46c7-9a40-3071d93d5ebf",
                "media_url": "https://cdn.newtail.com.br/retail_media/ads/2023/05/11/6e70ebdf2aaadcd6b6b651b2360fa920-1280x256-red.png",
                "destination_url": null,
                "type": "banner",
                "seller_id": "37582",
                "click_url": "https://newtail-media.newtail.com.br/v1/beacon/click/8771ebf0-ca93-46c7-9a40-3071d93d5ebf?publisher_id=3b7bcd3a-fde6-42d1-8de4-47a6e41a415a&ad_type=banner",
                "impression_url": "https://newtail-media.newtail.com.br/v1/beacon/impression/8771ebf0-ca93-46c7-9a40-3071d93d5ebf?publisher_id=3b7bcd3a-fde6-42d1-8de4-47a6e41a415a&ad_type=banner",
                "view_url": "https://newtail-media.newtail.com.br/v1/beacon/view/8771ebf0-ca93-46c7-9a40-3071d93d5ebf?publisher_id=3b7bcd3a-fde6-42d1-8de4-47a6e41a415a&ad_type=banner"
            }
        ],
        "nomeDoPlacement2": [
            {
                "ad_id": "c9483619-773d-450c-a1c8-5cbd31cd473e",
                "product_sku": "1547471458",
                "destination_url": "iphone-14-pro-apple-256gb-roxo-profundo-tela-de-61-quot-5g-camera-tripla-de-48mp-12mp-12mp/p/1547471458",
                "type": "product",
                "seller_id": "37582",
                "click_url": "https://newtail-media.newtail.com.br/v1/beacon/click/c9483619-773d-450c-a1c8-5cbd31cd473e?publisher_id=3b7bcd3a-fde6-42d1-8de4-47a6e41a415a&ad_type=product",
                "impression_url": "https://newtail-media.newtail.com.br/v1/beacon/impression/c9483619-773d-450c-a1c8-5cbd31cd473e?publisher_id=3b7bcd3a-fde6-42d1-8de4-47a6e41a415a&ad_type=product",
                "view_url": "https://newtail-media.newtail.com.br/v1/beacon/view/c9483619-773d-450c-a1c8-5cbd31cd473e?publisher_id=3b7bcd3a-fde6-42d1-8de4-47a6e41a415a&ad_type=product"
            }
        ]
    }
    

#

Formatos de Requests

As requests são POST e mantemos um cache de 10min.

#

Requisitando Ads

Abaixo um exemplos de requisições de anúncio de Produto Patrocinado:

Para as requisições, o `publisher_id` precisa ser informado. Ele será
disponibilizado pelo seu gerente de Conta.

##

Contexto de busca

###

Request

HTTP

    
    
    POST https://newtail-media.newtail.com.br/v1/rma/:publisher_id HTTP/1.1
    Content-Type: application/json
    
    {
        "context": "search",
        "term": "desodorante",
        "user_id": "6a746448-cf59-42bc-aa3d-a426844ad115",
        "session_id": "f361661f-5986-4779-9009-a34562f18347",
        "tags": ["Mega Maio"],
        "placements": {
            "nomePlacement1": { "quantity": 1, "size": "desktop", "types": ["banner"] },
            "nomePlacement3": { "quantity": 3, "size": "mobile", "types": ["product", "banner"] },
            "nomePlacement2": { "quantity": 2, "size": "tamanho3", "types": ["product"] }
        }
    }
    

**Resposta:**

    
    
    {
        "nomePlacement1": [
            {
                "ad_id": "6d2d8837-bf5a-4ba4-90d2-5546cb18d5ce",
                "media_url": "https://cdn.newtail.com.br/retail_media/ads/2023/05/03/f97a938660e56fe38a9c9ade21c27df8-1280x256-red.png",
                "destination_url": null,
                "type": "banner",
                "click_url": "https://newtail-media.newtail.com.br/v1/beacon/click/6d2d8837-bf5a-4ba4-90d2-5546cb18d5ce?publisher_id=0d675bf6-03f6-4b81-9617-e79dffddc3ab&ad_type=banner",
                "impression_url": "https://newtail-media.newtail.com.br/v1/beacon/impression/6d2d8837-bf5a-4ba4-90d2-5546cb18d5ce?publisher_id=0d675bf6-03f6-4b81-9617-e79dffddc3ab&ad_type=banner",
                "view_url": "https://newtail-media.newtail.com.br/v1/beacon/view/6d2d8837-bf5a-4ba4-90d2-5546cb18d5ce?publisher_id=0d675bf6-03f6-4b81-9617-e79dffddc3ab&ad_type=banner"
            }
        ],
        "nomePlacement3": [
            {
                "ad_id": "c06ef1c5-f9bb-4f53-96c2-d53769a95b9b",
                "media_url": "https://cdn.newtail.com.br/retail_media/ads/2023/05/03/d51e784c8541780b2bb53543bebd7f02-375x172-red.png",
                "destination_url": null,
                "type": "banner",
                "click_url": "https://newtail-media.newtail.com.br/v1/beacon/click/c06ef1c5-f9bb-4f53-96c2-d53769a95b9b?publisher_id=0d675bf6-03f6-4b81-9617-e79dffddc3ab&ad_type=banner",
                "impression_url": "https://newtail-media.newtail.com.br/v1/beacon/impression/c06ef1c5-f9bb-4f53-96c2-d53769a95b9b?publisher_id=0d675bf6-03f6-4b81-9617-e79dffddc3ab&ad_type=banner",
                "view_url": "https://newtail-media.newtail.com.br/v1/beacon/view/c06ef1c5-f9bb-4f53-96c2-d53769a95b9b?publisher_id=0d675bf6-03f6-4b81-9617-e79dffddc3ab&ad_type=banner"
            },
            {
                "ad_id": "846fbf5e-6980-4a5e-a4a1-9b2a2dcbafb7",
                "product_sku": "10001236",
                "type": "product",
                "click_url": "https://newtail-media.newtail.com.br/v1/beacon/click/846fbf5e-6980-4a5e-a4a1-9b2a2dcbafb7?publisher_id=0d675bf6-03f6-4b81-9617-e79dffddc3ab&ad_type=product",
                "impression_url": "https://newtail-media.newtail.com.br/v1/beacon/impression/846fbf5e-6980-4a5e-a4a1-9b2a2dcbafb7?publisher_id=0d675bf6-03f6-4b81-9617-e79dffddc3ab&ad_type=product",
                "view_url": "https://newtail-media.newtail.com.br/v1/beacon/view/846fbf5e-6980-4a5e-a4a1-9b2a2dcbafb7?publisher_id=0d675bf6-03f6-4b81-9617-e79dffddc3ab&ad_type=product"
            },
            {
                "ad_id": "243ad5fe-53e1-4fc1-ac86-9f5286c48a8a",
                "product_sku": "104810",
                "type": "product",
                "click_url": "https://newtail-media.newtail.com.br/v1/beacon/click/243ad5fe-53e1-4fc1-ac86-9f5286c48a8a?publisher_id=0d675bf6-03f6-4b81-9617-e79dffddc3ab&ad_type=product",
                "impression_url": "https://newtail-media.newtail.com.br/v1/beacon/impression/243ad5fe-53e1-4fc1-ac86-9f5286c48a8a?publisher_id=0d675bf6-03f6-4b81-9617-e79dffddc3ab&ad_type=product",
                "view_url": "https://newtail-media.newtail.com.br/v1/beacon/view/243ad5fe-53e1-4fc1-ac86-9f5286c48a8a?publisher_id=0d675bf6-03f6-4b81-9617-e79dffddc3ab&ad_type=product"
            }
        ],
        "nomePlacement2": [
            {
                "ad_id": "846fbf5e-6980-4a5e-a4a1-9b2a2dcbafb7",
                "product_sku": "10001236",
                "type": "product",
                "click_url": "https://newtail-media.newtail.com.br/v1/beacon/click/846fbf5e-6980-4a5e-a4a1-9b2a2dcbafb7?publisher_id=0d675bf6-03f6-4b81-9617-e79dffddc3ab&ad_type=product",
                "impression_url": "https://newtail-media.newtail.com.br/v1/beacon/impression/846fbf5e-6980-4a5e-a4a1-9b2a2dcbafb7?publisher_id=0d675bf6-03f6-4b81-9617-e79dffddc3ab&ad_type=product",
                "view_url": "https://newtail-media.newtail.com.br/v1/beacon/view/846fbf5e-6980-4a5e-a4a1-9b2a2dcbafb7?publisher_id=0d675bf6-03f6-4b81-9617-e79dffddc3ab&ad_type=product"
            },
            {
                "ad_id": "243ad5fe-53e1-4fc1-ac86-9f5286c48a8a",
                "product_sku": "104810",
                "type": "product",
                "click_url": "https://newtail-media.newtail.com.br/v1/beacon/click/243ad5fe-53e1-4fc1-ac86-9f5286c48a8a?publisher_id=0d675bf6-03f6-4b81-9617-e79dffddc3ab&ad_type=product",
                "impression_url": "https://newtail-media.newtail.com.br/v1/beacon/impression/243ad5fe-53e1-4fc1-ac86-9f5286c48a8a?publisher_id=0d675bf6-03f6-4b81-9617-e79dffddc3ab&ad_type=product",
                "view_url": "https://newtail-media.newtail.com.br/v1/beacon/view/243ad5fe-53e1-4fc1-ac86-9f5286c48a8a?publisher_id=0d675bf6-03f6-4b81-9617-e79dffddc3ab&ad_type=product"
            }
        ]
    }
    

##

Contexto de categoria

HTTP

    
    
    POST https://newtail-media.newtail.com.br/v1/rma/:publisher_id HTTP/1.1
    Content-Type: application/json
    
    {
        "context": "category",
        "category_name": "Telefones e Celulares > Smartphones > iPhone",
        "user_id": "6a746448-cf59-42bc-aa3d-a426844ad115",
        "session_id": "f361661f-5986-4779-9009-a34562f18347",
        "placements": {
            "nomePlacement1": { "quantity": 1, "size": "tamanho1", "types": ["banner"] },
            "nomePlacement3": { "quantity": 3, "size": "tamanho1", "types": ["product", "banner"] },
            "nomePlacement2": { "quantity": 2, "size": "tamanho3", "types": ["product"] }
        }
    }
    
    

##

Contexto de Marca

HTTP

    
    
    POST https://newtail-media.newtail.com.br/v1/rma/:publisher_id HTTP/1.1
    Content-Type: application/json
    
    {
        "context": "brand",
        "brand_name": "iphone",
        "user_id": "6a746448-cf59-42bc-aa3d-a426844ad115",
        "session_id": "f361661f-5986-4779-9009-a34562f18347",
        "placements": {
            "nomePlacement1": { "quantity": 1, "size": "tamanho1", "types": ["banner"] },
            "nomePlacement3": { "quantity": 3, "size": "tamanho1", "types": ["product", "banner"] },
            "nomePlacement2": { "quantity": 2, "size": "tamanho3", "types": ["product"] }
        }
    }
    
    

##

Contexto de página de produto

HTTP

    
    
    POST https://newtail-media.newtail.com.br/v1/rma/:publisher_id HTTP/1.1
    Content-Type: application/json
    
    {
      "context": "product_page",
      "product_sku": "120210",
      "product_attributes": {
        "category_name: "Telefones e Celulares > Smartphones > iPhone",
        "brand": "iphone"
      },
      "user_id": "6f92d1e9-00b6-4f8b-9645-faeab321e1cc",
      "session_id": "5898b8d1-c250-4bb5-931b-8b9d0ee7b499",
      "placements": {
        "nomePlacement1": { "quantity": 1, "size": "tamanho1", "types": ["banner"] },
        "nomePlacement3": { "quantity": 3, "size": "tamanho1", "types": ["product", "banner"] },
        "nomePlacement2": { "quantity": 2, "size": "tamanho3", "types": ["product"] }
      }
    }
    

##

Contexto da home (sem segmentação)

No caso de um contexto sem segmentação, como a Home, será exibido uma lista de
anúncios que terão maior relevância para aquele user_id. É muito importante
que tenhamos um histórico e a identificação correta do usuário para que esse
contexto seja mais relevante.

###

Request POST

HTTP

    
    
    POST https://newtail-media.newtail.com.br/v1/rma/:publisher_id HTTP/1.1
    Content-Type: application/json
    
    {
      "context": "home",
      "user_id": "6f92d1e9-00b6-4f8b-9645-faeab321e1cc",
      "session_id": "5898b8d1-c250-4bb5-931b-8b9d0ee7b499",
      "placements": {
        "nomePlacement1": { "quantity": 1, "size": "tamanho1", "types": ["banner"] },
        "nomePlacement3": { "quantity": 3, "size": "tamanho1", "types": ["product", "banner"] },
        "nomePlacement2": { "quantity": 2, "size": "tamanho3", "types": ["product"] }
      }
    }
    

##

Reposta da requisição de Produtos Patrocinados

Os resultados serão retornados em ordem de acordo com a consulta. Sendo assim,
1º objeto da lista de retorno, é referênte ao 1º objeto da lista da consulta.

###

Response

> O retorno da requisição terá código HTTP 200

JSON

    
    
    {
        "nomePlacement1": [
            {
                "ad_id": "6d2d8837-bf5a-4ba4-90d2-5546cb18d5ce",
                "media_url": "https://cdn.newtail.com.br/retail_media/ads/2023/05/03/f97a938660e56fe38a9c9ade21c27df8-1280x256-red.png",
                "destination_url": null,
                "type": "banner",
                "click_url": "https://newtail-media.newtail.com.br/v1/beacon/click/6d2d8837-bf5a-4ba4-90d2-5546cb18d5ce?publisher_id=0d675bf6-03f6-4b81-9617-e79dffddc3ab&ad_type=banner",
                "impression_url": "https://newtail-media.newtail.com.br/v1/beacon/impression/6d2d8837-bf5a-4ba4-90d2-5546cb18d5ce?publisher_id=0d675bf6-03f6-4b81-9617-e79dffddc3ab&ad_type=banner",
                "view_url": "https://newtail-media.newtail.com.br/v1/beacon/view/6d2d8837-bf5a-4ba4-90d2-5546cb18d5ce?publisher_id=0d675bf6-03f6-4b81-9617-e79dffddc3ab&ad_type=banner"
            }
        ],
        "nomePlacement3": [
            {
                "ad_id": "c06ef1c5-f9bb-4f53-96c2-d53769a95b9b",
                "media_url": "https://cdn.newtail.com.br/retail_media/ads/2023/05/03/d51e784c8541780b2bb53543bebd7f02-375x172-red.png",
                "destination_url": null,
                "type": "banner",
                "click_url": "https://newtail-media.newtail.com.br/v1/beacon/click/c06ef1c5-f9bb-4f53-96c2-d53769a95b9b?publisher_id=0d675bf6-03f6-4b81-9617-e79dffddc3ab&ad_type=banner",
                "impression_url": "https://newtail-media.newtail.com.br/v1/beacon/impression/c06ef1c5-f9bb-4f53-96c2-d53769a95b9b?publisher_id=0d675bf6-03f6-4b81-9617-e79dffddc3ab&ad_type=banner",
                "view_url": "https://newtail-media.newtail.com.br/v1/beacon/view/c06ef1c5-f9bb-4f53-96c2-d53769a95b9b?publisher_id=0d675bf6-03f6-4b81-9617-e79dffddc3ab&ad_type=banner"
            },
            {
                "ad_id": "846fbf5e-6980-4a5e-a4a1-9b2a2dcbafb7",
                "product_sku": "10001236",
                "type": "product",
                "click_url": "https://newtail-media.newtail.com.br/v1/beacon/click/846fbf5e-6980-4a5e-a4a1-9b2a2dcbafb7?publisher_id=0d675bf6-03f6-4b81-9617-e79dffddc3ab&ad_type=product",
                "impression_url": "https://newtail-media.newtail.com.br/v1/beacon/impression/846fbf5e-6980-4a5e-a4a1-9b2a2dcbafb7?publisher_id=0d675bf6-03f6-4b81-9617-e79dffddc3ab&ad_type=product",
                "view_url": "https://newtail-media.newtail.com.br/v1/beacon/view/846fbf5e-6980-4a5e-a4a1-9b2a2dcbafb7?publisher_id=0d675bf6-03f6-4b81-9617-e79dffddc3ab&ad_type=product"
            },
            {
                "ad_id": "243ad5fe-53e1-4fc1-ac86-9f5286c48a8a",
                "product_sku": "104810",
                "type": "product",
                "click_url": "https://newtail-media.newtail.com.br/v1/beacon/click/243ad5fe-53e1-4fc1-ac86-9f5286c48a8a?publisher_id=0d675bf6-03f6-4b81-9617-e79dffddc3ab&ad_type=product",
                "impression_url": "https://newtail-media.newtail.com.br/v1/beacon/impression/243ad5fe-53e1-4fc1-ac86-9f5286c48a8a?publisher_id=0d675bf6-03f6-4b81-9617-e79dffddc3ab&ad_type=product",
                "view_url": "https://newtail-media.newtail.com.br/v1/beacon/view/243ad5fe-53e1-4fc1-ac86-9f5286c48a8a?publisher_id=0d675bf6-03f6-4b81-9617-e79dffddc3ab&ad_type=product"
            }
        ],
        "nomePlacement2": [
            {
                "ad_id": "846fbf5e-6980-4a5e-a4a1-9b2a2dcbafb7",
                "product_sku": "10001236",
                "type": "product",
                "click_url": "https://newtail-media.newtail.com.br/v1/beacon/click/846fbf5e-6980-4a5e-a4a1-9b2a2dcbafb7?publisher_id=0d675bf6-03f6-4b81-9617-e79dffddc3ab&ad_type=product",
                "impression_url": "https://newtail-media.newtail.com.br/v1/beacon/impression/846fbf5e-6980-4a5e-a4a1-9b2a2dcbafb7?publisher_id=0d675bf6-03f6-4b81-9617-e79dffddc3ab&ad_type=product",
                "view_url": "https://newtail-media.newtail.com.br/v1/beacon/view/846fbf5e-6980-4a5e-a4a1-9b2a2dcbafb7?publisher_id=0d675bf6-03f6-4b81-9617-e79dffddc3ab&ad_type=product"
            },
            {
                "ad_id": "243ad5fe-53e1-4fc1-ac86-9f5286c48a8a",
                "product_sku": "104810",
                "type": "product",
                "click_url": "https://newtail-media.newtail.com.br/v1/beacon/click/243ad5fe-53e1-4fc1-ac86-9f5286c48a8a?publisher_id=0d675bf6-03f6-4b81-9617-e79dffddc3ab&ad_type=product",
                "impression_url": "https://newtail-media.newtail.com.br/v1/beacon/impression/243ad5fe-53e1-4fc1-ac86-9f5286c48a8a?publisher_id=0d675bf6-03f6-4b81-9617-e79dffddc3ab&ad_type=product",
                "view_url": "https://newtail-media.newtail.com.br/v1/beacon/view/243ad5fe-53e1-4fc1-ac86-9f5286c48a8a?publisher_id=0d675bf6-03f6-4b81-9617-e79dffddc3ab&ad_type=product"
            }
        ]
    }
    

##

Sponsored Brands

![](https://files.readme.io/5a547d7-image.png)

A campanha de "sponsored_brands" possui algumas diferenças e relação a sua
resposta.

**Requisição**

    
    
    {
        "context": "search",
        "term": "smartphone",
        "placements": {
            "placement_name": { "quantity": 1, "types": ["sponsored_brand"] }
        }
    }
    

**Resposta**

> ## 🚧
>
> Atenção para os Eventos
>
> Todos os eventos devem ser disparados para o Anúncio e para os seus
> Produtos.

Atributo| Descrição| Tipo  
---|---|---  
assets| Endereço e Tipo da imagem/vídeo da campanha. Será retornado 1 ou mais
assets.| Array  
assets.#.type| Indica o tipo de asset.  
  
\- image  
\- video| String  
assets.#.url| Url do asset| String  
assets.#.dimension| dimensão do asset.  
Exemplo: 720x480| String  
logo_url| URL do endereço da imagem do logo da marca| String  
brand_name| Nome da Marca| String  
headline| Descrição to título do anúncio| String  
description| Descrição adicional do Anúncio| String  
impression_url| URL de destino do evento de impressão| String  
view_url| URL de destino do evento de visualização| String  
click_url| URL de destino do evento de click| String  
products| Lista de Produtos| Array  
products.#.image_url| URL da imagem do produto| String  
products.#.seller_id| Identificador único do seller| String  
products.#.product_metadata| Informações de metadata do produto (informado no
momento do cadastro do produto)| Object  
products.#.product_name| Nome do produto| String  
products.#.product_sku| SKU do produto| String  
products.#.destination_url| URL de destino do produto| String  
products.#.impression_url| URL de impressão do produto| String  
products.#.view_url| URL de visualização do produto| String  
products.#.click_url| URL de evento de click que deve ser disparado quando o
cliente final clicar no produto| String  
      
    
    {
        "placement_name": [
            {
                "type": "sponsored_brand",
    
                "assets": [
                    {
                       "type": "image|video",
                       "url": "URL da imagem"
                    }
                ],
    
                "brand_url": "https://cdn.newtail.com.br/retail_media/brands/logo.jpeg",
                "brand_name": "Apple",
    
                "destination_url": "https://www.extra.com.br/c?Filtro=D70653",
    
                "headline": "Tinânio. Muito Robusto, muito leve, muito pro!",
                "description": "",
    
                "view_url": "URL DE VIEW",
                "impression_url": "URL DE IMPRESSÃO",
                "click_url": "URL de CLICK",
    
                "products": [
                    {  
                        "image_url": "URL DA IMAGEM DO PRODUTO",
                        "seller_id": null,
                        "product_metadata": {                    },
                        "product_name": "Iphone 15 Pro MAX",
                        "product_sku": "55064355",
                        "destination_url": "URL do PRODUTO",
                        "impression_url": "URL DE IMPRESSION em um PRODUTO específico"
                        "view_url": "URL DE VIEW em um PRODUTO específico",
                        "click_url": "URL DE CLICK em um PRODUTO específico",
                    }
                ]
            }
        ]
    }
    

  * __Table of Contents
  *     * Informações básicas
      * Campos da Resposta de Consulta de Anúncios
    * Formatos de Requests
    * Requisitando Ads
      * Contexto de busca
      * Contexto de categoria
      * Contexto de Marca
      * Contexto de página de produto
      * Contexto da home (sem segmentação)
      * Reposta da requisição de Produtos Patrocinados
      * Sponsored Brands

