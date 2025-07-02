# **Documentação da API de Retail Media**

## 1. Resumo

Esta documentação detalha a integração com a **Retail Media API**, o ponto central de conexão entre a solução da VTEX Ads e a plataforma do varejista (publisher). A solução foi desenvolvida sob o conceito **API-first**, garantindo flexibilidade total para que os varejistas integrem e exibam anúncios em qualquer canal digital: e-commerce, marketplace, aplicativo ou até mesmo em totens e telas físicas (Digital Signage).

Nossa arquitetura é **cookie-less**, o que significa que não dependemos de cookies de terceiros. A identificação e segmentação são baseadas em identificadores próprios (`user_id`, `session_id`) e dados primários (first-party data), garantindo uma solução robusta, em conformidade com as novas políticas de privacidade e preparada para o futuro do varejo digital.

Através desta API REST, sua plataforma poderá:
* Sincronizar o catálogo de produtos e inventário.
* Requisitar anúncios relevantes em tempo real para o contexto de navegação do usuário.
* Enviar eventos de interação (impressão, visualização, clique, conversão) para mensuração de performance.

## 2. Glossário

| Termo | Descrição |
| :--- | :--- |
| **Advertiser (Anunciante)** | Empresas, sellers ou indivíduos que promovem seus produtos, serviços ou ideias através de campanhas. |
| **Publisher (Varejista)** | A entidade que possui e opera a plataforma digital (site, app) e disponibiliza os espaços para a exibição de anúncios. |
| **Campanha** | Ação criada por um anunciante para promover produtos e gerar conversões (vendas). |
| **Impressão** | Contabilizada cada vez que um anúncio é exibido na tela do usuário. |
| **Visualização (View)**| Contabilizada quando uma impressão se torna visível na tela do usuário por um tempo determinado. |
| **Clique** | Interação do usuário ao clicar em um anúncio para ser direcionado à página de destino. |
| **Conversão** | Ação de valor gerada por um anúncio, tipicamente uma venda. |
| **Receita com Anúncios** | Valor obtido pelos varejistas ao monetizarem seus espaços publicitários. |
| **Receita com Vendas** | Valor total obtido por uma empresa a partir das vendas de produtos ou serviços. |
| **CTR (Click-Through Rate)** | Taxa de Cliques. Fórmula: `(Cliques / Impressões) * 100`. Mede a atratividade de um anúncio. |
| **ROAS (Return on Ad Spend)**| Retorno Sobre o Investimento em Publicidade. Fórmula: `Receita Gerada por Anúncios / Custo da Publicidade`. |
| **Taxa de Conversão** | Percentual de conversões em relação ao total de cliques ou visitas. |

## 3. Autenticação

A autenticação é necessária **apenas para os endpoints de sincronização do catálogo de produtos**. As demais chamadas, como consulta de anúncios e notificação de eventos, são públicas e não exigem autenticação.

Para os endpoints protegidos, as credenciais devem ser enviadas via header HTTP. Solicite as suas credenciais ao gerente de conta.

| Atributo | Descrição |
| :--- | :--- |
| `x-app-id` | ID exclusivo da sua aplicação para a integração. |
| `x-api-key` | Chave de API associada à sua aplicação. |

## 4. Integração Principal

A integração é fundamentada em três pilares que garantem o funcionamento da solução.

### Pilares da Integração

1.  **Catálogo:** Manter a VTEX Ads sincronizada com seu catálogo de produtos e inventário (preço e estoque). Essencial para anúncios de produto.
2.  **Consulta de Anúncios:** Sua plataforma requisita à API os anúncios que devem ser exibidos em diferentes páginas e contextos.
3.  **Eventos:** Sua plataforma notifica a API sobre todas as interações do usuário com os anúncios e, crucialmente, sobre as conversões (vendas).

### Tipos de Anúncios

| Tipo de Anúncio | API Type | Descrição                                       |
| :--- | :--- |:------------------------------------------------|
| **Sponsored Products** | `product` | Anúncios de produtos individuais.               |
| **Display Banner** | `banner` | Anúncios visuais (imagem estática ou vídeo).    |
| **Sponsored Brands** | `sponsored_brand` | Anúncios de marca com título, logo e produtos. (imagem estática ou vídeo) |
| **Digital Signage** | `digital_signage`| Conteúdo para telas e totens físicos.           |

### 4.1. Catálogo

O primeiro passo é a sincronização, que ocorre em duas frentes:

> **Nota para lojas VTEX:** Para lojas na plataforma VTEX, a sincronização do catálogo ocorre de forma transparente, não sendo necessária nenhuma integração adicional para este fim.

#### **Sincronização de Produtos**
Envio das informações cadastrais dos produtos. Requer autenticação.

* **Endpoint:** `POST https://api-retail-media.newtail.com.br/product/bulk/products`
* **Limites:** 500 produtos por requisição; 3 requisições simultâneas.

| Campo | Descrição | Tipo | Obrigatório? |
| :--- | :--- | :--- | :--- |
| `product_sku` | ID/SKU único do produto. | String | Sim |
| `parent_sku` | SKU do produto pai (para variações). | String | Não |
| `name` | Nome do produto. | String | Sim |
| `url` | URL canônica da página do produto. | String | Sim |
| `image_url`| URL da imagem principal do produto. | String | Não |
| `categories` | Lista de categorias. | Array[String] | Sim |
| `brand` | Marca do produto. | String | Não |
| `gtins` | Códigos de barras (EAN). **Obrigatório para campanhas na VTEX Ads Network.**| Array[String] | Não/Sim |
| `tags` | "Etiquetas" para contextualizar buscas. Máx. 10 por SKU, 64 chars por tag. Apenas para campanhas de `product`. | Array[String] | Não |
| `sellers` | Lista de sellers que vendem o produto (em um marketplace). | Array[String] | Não |
| `metadata` | Objeto para informações adicionais (chave-valor). | Object | Não |

**Exemplo de Requisição:**

```bash
curl --location 'https://api-retail-media.newtail.com.br/product/bulk/products' \
--header 'x-app-id: XXXX' \
--header 'x-api-key: YYYY' \
--header 'Content-Type: application/json' \
--data '[
    {
        "product_sku": "allan",
        "name": "allan",
        "url": "https://www.panvel.com/panvel/eau-de-dali-salvador-dali-eau-de-toilette-perfume-feminino-30ml/p-10007616",
        "image_url": "https://panvelprd.vteximg.com.br/arquivos/ids/177629",
        "categories": [
            "Beleza",
            "Beleza > Fragrâncias",
            "Beleza > Fragrâncias > Perfume",
            "Beleza > Fragrâncias > Perfume > Para Mulher"
        ],
        "brand": "SALVADOR DALÍ",
        "profit_margin": null,
        "gtins": [
            "3331438450103"
        ],
        "sellers": [],
        "skus": []
    },
    {
        "product_sku": "allan2",
        "name": "allan2",
        "url": "https://www.panvel.com/panvel/eau-de-dali-salvador-dali-eau-de-toilette-perfume-feminino-30ml/p-10007616",
        "image_url": "https://panvelprd.vteximg.com.br/arquivos/ids/177629",
        "categories": [
            "Beleza",
            "Beleza > Fragrâncias",
            "Beleza > Fragrâncias > Perfume",
            "Beleza > Fragrâncias > Perfume > Para Mulher"
        ],
        "brand": "SALVADOR DALÍ",
        "profit_margin": null,
        "gtins": [
            "3331438450103"
        ],
        "sellers": [],
        "skus": [],
        "tags": ["Abart", "Mega Maio"]
    }
]'
```

**Exemplo de Resposta com Sucesso:**

```
Status: 202 Accepted
Content-Type: application/json

{
    "messages": [
        "products will be processed soon"
    ]
}
```

**Exemplo de Resposta com Erro:**

Para as validações, utilizamos o formato da [RFC 8927](https://datatracker.ietf.org/doc/rfc8927/).
O retorno da requisição terá código HTTP 422.

```
Status: 422 Unprocessable Entity
Content-Type: application/json

[
  {
    instancePath: '/0',
    schemaPath: '#/items/required',
    keyword: 'required',
    params: { missingProperty: 'product_sku' },
    message: "must have required property 'product_sku'",
  },
  {
    instancePath: '/0',
    schemaPath: '#/items/required',
    keyword: 'required',
    params: { missingProperty: 'url' },
    message: "must have required property 'url'",
  },
  {
    instancePath: '/0',
    schemaPath: '#/items/required',
    keyword: 'required',
    params: { missingProperty: 'image_url' },
    message: "must have required property 'image_url'",
  },
  {
    instancePath: '/1',
    schemaPath: '#/items/required',
    keyword: 'required',
    params: { missingProperty: 'name' },
    message: "must have required property 'name'",
  },
  {
    instancePath: '/1',
    schemaPath: '#/items/required',
    keyword: 'required',
    params: { missingProperty: 'url' },
    message: "must have required property 'url'",
  },
  {
    instancePath: '/1',
    schemaPath: '#/items/required',
    keyword: 'required',
    params: { missingProperty: 'image_url' },
    message: "must have required property 'image_url'",
  },
]
```

#### **Sincronização de Inventário**
Atualização de preço, preço promocional e disponibilidade. Requer autenticação.

* **Endpoint:** `POST https://api-retail-media.newtail.com.br/product/bulk/inventories`
* **Limites:** Idênticos à sincronização de produtos.

> **Nota:** Caso o inventário não seja enviado, todos os produtos serão considerados sempre disponíveis.

| Campo | Descrição | Tipo | Obrigatório? |
| :--- | :--- | :--- | :--- |
| `product_sku` | ID/SKU do produto a ser atualizado. | String | Sim |
| `store_id` | ID da loja física/CD. Se nulo, aplica-se a todos. | String | Não |
| `price` | Preço "de" do produto. | Number | Sim |
| `promotional_price`| Preço "por". Envie 0 para remover. | Number | Sim |
| `is_available` | Indica se o produto está disponível (`true`/`false`). | Boolean | Sim |

**Exemplo de Requisição:**

```bash
curl --location 'https://api-retail-media.newtail.com.br/product/bulk/inventories' \
--header 'x-app-id: XXXX' \
--header 'x-api-key: YYYY' \
--header 'Content-Type: application/json' \
--data '[
    {
        "product_sku": "allan",
        "price": 129.90,
        "promotional_price": 99.90,
        "is_available": true
    },
    {
        "product_sku": "allan2",
        "store_id": "loja-centro",
        "price": 149.90,
        "promotional_price": 119.90,
        "is_available": true
    }
]'
```

#### **Métodos Alternativos de Integração de Catálogo**

Além da API REST, oferecemos outras formas de integração do catálogo:

* **Elasticsearch do Cliente:** Podemos nos conectar diretamente à sua instância de Elasticsearch.
* **Algolia:** Integração com sua conta Algolia existente.
* **Google XML:** Suporte ao formato XML padrão do Google Shopping.

> **Importante:** Independentemente do método escolhido, todas as informações obrigatórias do catálogo devem estar disponíveis na fonte de dados.

### 4.2. Consulta de Anúncios

Com o catálogo sincronizado, sua plataforma requisita anúncios para preencher os espaços publicitários (`placements`). A requisição é um `POST` e o `publisher_id` deve ser informado na URL.

* **Endpoint:** `POST https://newtail-media.newtail.com.br/v1/rma/:publisher_id`
* **Content-Type:** Todas as requisições devem incluir o header `Content-Type: application/json`

#### **Parâmetros da Requisição**

| Campo | Descrição | Tipo | Obrigatoriedade |
| :--- | :--- | :--- | :--- |
| `session_id` | ID único da sessão do usuário (alfanumérico). | String | Sim |
| `user_id` | ID único do usuário logado (alfanumérico). | String | Não |
| `store_id` | Filtra anúncios por estoque de uma loja específica. | String | Não |
| `channel` | Canal de acesso: `site`, `msite`, `app`. | String | Sim |
| `context` | Contexto: `home`, `category`, `search`, `product_page`, `brand_page`, `digital_signage`.| String | Sim |
| `term` | Termo buscado pelo usuário. | String | Apenas `context: 'search'` |
| `category_name` | Categoria navegada (breadcrumb completo).| String | Apenas `context: 'category'`|
| `product_sku` | SKU do produto sendo visualizado. | String | Apenas `context: 'product_page'` |
| `brand_name` | Nome da marca sendo visualizada. | String | Apenas `context: 'brand_page'` |
| `device_id` | ID único do dispositivo (tela, totem). | String | Apenas `context: 'digital_signage'` |
| `store_name` | Nome da loja onde o dispositivo está localizado. | String | Apenas `context: 'digital_signage'` |
| `placements` | Objeto que define os espaços (`placements`) de anúncio. | Object | Sim |
| `placements.{name}.quantity` | Quantidade de anúncios desejada. | Integer | Sim |
| `placements.{name}.size` | Tamanho esperado (ex: `desktop`). | String | Apenas `types: ['banner', 'sponsored_brand']` |
| `placements.{name}.types` | Tipos permitidos (`product`, `banner`, etc.). | Array[String] | Sim |
| `placements.{name}.assets_type`| Mídias aceitas (`image`, `video`). Padrão: `["image"]`. | Array[String] | Apenas `types: ['banner', 'sponsored_brand']` |
| `userAgent` | String de identificação do ambiente do cliente. | String | Não |
| `segmentation` | Dados para segmentação em tempo real. | Array[Object] | Não |

#### **Resposta da Consulta**
A resposta é um JSON onde cada chave é um nome de `placement`. Para anúncios do tipo `sponsored_brand` e `digital_signage`, a estrutura interna varia (ver seções específicas).

| Campo na Resposta (`product`, `banner`) | Descrição |
| :--- | :--- |
| `{placementName}.#.ad_id` | ID único do anúncio. |
| `{placementName}.#.type` | Tipo do anúncio (`banner`, `product`). |
| `{placementName}.#.media_url`| URL da imagem ou vídeo a ser exibido. |
| `{placementName}.#.click_url`| **URL para notificar o evento de clique.** |
| `{placementName}.#.impression_url`| **URL para notificar o evento de impressão.**|
| `{placementName}.#.view_url` | **URL para notificar o evento de visualização.** |
| `{placementName}.#.product_sku`| SKU (para anúncios do tipo `product`). |

### 4.3. Eventos

A notificação de eventos é **crucial** para a atribuição e mensuração.

#### **Identificação de Usuário e Sessão**

* **`session_id`:** ID da sessão do usuário. Obrigatório em todos os eventos. Deve ser consistente durante a navegação.
* **`user_id`:** ID único do cliente na plataforma, consistente entre canais. Obrigatório no evento de conversão.

#### **Notificação de Impressão, Visualização e Clique**

Envie uma requisição `POST` para a respectiva URL de evento (`impression_url`, `view_url`, `click_url`) fornecida na consulta de anúncios, com um corpo JSON contendo `user_id` e `session_id`.

* **Content-Type:** Todas as requisições devem incluir o header `Content-Type: application/json`
* **Método Recomendado (Navegador):** Use `navigator.sendBeacon()` para garantir o envio assíncrono sem bloquear a navegação.
* **Resposta de Sucesso:** `HTTP 202 Accepted`.

#### **Notificação de Conversão**

Quando uma compra é finalizada, envie os dados do pedido.

* **Endpoint:** `POST https://events.newtail-media.newtail.com.br/v1/beacon/conversion`
* **Content-Type:** Todas as requisições devem incluir o header `Content-Type: application/json`
* **Corpo da Requisição:** O objeto deve conter os dados do pedido. O preço do item não deve ser multiplicado pela quantidade.

| Campo do Pedido | Descrição | Tipo | Obrigatório? |
| :--- | :--- | :--- | :--- |
| `publisher_id` | ID do publisher. | String | Sim |
| `user_id` | ID do usuário que realizou a compra. | String | Sim |
| `session_id` | ID da sessão da compra. | String | Sim |
| `order_id` | ID do pedido. | String | Sim |
| `email_hashed` | E-mail do usuário em formato hash (SHA256). | String | Sim |
| `created_at` | Data/hora do pedido (ISO 8601 em UTC). | String | Sim |
| `items` | Lista de itens do pedido. | Array[Item] | Sim |
| `phone_hashed`| Telefone do usuário em hash (SHA256). | String | Não (Recomendado) |
| `social_id_hashed`| CPF/CNPJ do usuário em hash (SHA256). | String | Não (Recomendado) |

#### **Regras de Atribuição e Deduplicação**

* **Janela de Conversão:** Período após uma interação em que uma venda pode ser atribuída ao anúncio.
    * **Click (para `product`):** 7 dias.
    * **Visualização (para `display`/`video`):** 14 dias.
* **Deduplicação de Eventos:** Para o mesmo usuário e anúncio, eventos são ignorados por um período.
    * **Impressões:** 1 minuto.
    * **Cliques:** 1 hora.
    * **Conversões:** Não são deduplicadas (exceto se o mesmo `order_id` for enviado novamente em até 30 dias).

### 4.4. Segmentação de Anúncios

Direcione anúncios para públicos específicos para aumentar a relevância.

#### **Segmentação em Tempo Real**
Envie dados demográficos ou de audiência diretamente no corpo da **consulta de anúncios**, no campo `segmentation`.

O campo `segmentation` é um array de objetos, onde cada objeto contém:
- `key`: O tipo de segmentação (ex: "STATE", "CITY", "GENDER")
- `values`: Array de valores para a segmentação

**Exemplo de Segmentação:**

```json
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
```

**Tipos de Segmentação Disponíveis:**

| Chave (key) | Descrição | Exemplo de Valores |
| :--- | :--- | :--- |
| `STATE` | Estado do usuário | "SP", "RJ", "MG" |
| `CITY` | Cidade do usuário | "São Paulo", "Rio de Janeiro" |
| `NEIGHBOURHOOD` | Bairro do usuário | "Vila Mariana", "Copacabana" |
| `GENDER` | Gênero do usuário | "M", "F" |
| `AGE_RANGE` | Faixa etária do usuário | "18-24", "25-34", "35-44" |
| `INCOME_RANGE` | Faixa de renda | "A", "B1", "B2", "C1", "C2", "DE" |
| `INTEREST` | Interesses do usuário | "Esportes", "Tecnologia", "Moda" |
| `CUSTOM_AUDIENCE` | Audiência personalizada | "high_value_customers", "cart_abandoners" |

#### **Envio de Dados de Audiência (Batch)**
Para criar audiências persistentes associadas a um `user_id`, envie arquivos de dados para um bucket S3.

* **Formato:** `Parquet` com compressão `Snappy`.
* **Segurança (Hashing):** Dados PII (e-mail, CPF, telefone, nome) devem ser criptografados com **SHA256** após limpeza (sem espaços, minúsculo) e normalização (telefone no padrão E.164, ex: `+5511987654321`).
* **Atributos:** `CUSTOMER_ID`, `EMAIL_HASHED`, `PHONE_HASHED`, `SOCIAL_ID_HASHED`, `GENDER`, `AGE`, `CITY`, `STATE`, `AUDIENCES`, `NBO_CATEGORIES` (categorias de intenção de compra), etc.

### 4.5. Boas Práticas

* **Persistência HTTP:** Use conexões HTTP persistentes (`Connection: keep-alive` no header) para otimizar a performance.
* **Timeout:** Implemente um timeout de 500-600ms nas chamadas de consulta de anúncios para não prejudicar a experiência do usuário.
* **Nomenclatura de Placements:** Adote um padrão claro, como `{canal}_{contexto}_{posicao}_{tipo}` (ex: `msite_search_top-shelf_product`).

## 5. Reports e Exportação de Dados

### 5.1. Exportação via API
Endpoints REST para extrair relatórios consolidados em JSON (ou XLSX com `download=true`).

* `GET /report/v2/advertisers`: Desempenho por anunciante (visão do publisher).
* `GET /report/v2/publishers`: Desempenho por publisher (visão do anunciante).
* `GET /campaign/v2`: Relatório detalhado de campanhas.
* `GET /ad/results/v2`: Relatório de performance de anúncios individuais.

### 5.2. Exportação de Dados Brutos (via Storage)
Configuramos a exportação diária (D-1) de dados para um bucket de sua preferência (AWS S3, Google Cloud Storage, Azure Blob).

* **Eventos (impressões, cliques, conversões):** Arquivos `Parquet` + `Snappy`. É necessário fazer a de-duplicação usando o `event_id`.
* **Dados Agregados (relatórios de campanhas, anunciantes):** Arquivos `CSV`.

## 6. Outras Integrações

### 6.1. Integração com Marketplace
Oferecemos um conjunto de APIs para a integração completa com plataformas de Marketplace.

* **Autenticação:** Mútua, com o Marketplace usando Basic Auth para receber chamadas da Newtail, e a Newtail usando `x-app-id`/`x-api-key` para receber chamadas do Marketplace.
* **API de Catálogo:** O Marketplace deve expor um endpoint `GET /search` para que a Newtail possa consultar produtos por `seller_id`, `name`, `skus`, etc.
* **APIs de Gestão:** A Newtail expõe endpoints para o Marketplace gerenciar Anunciantes (`/api/v1/advertisers`), Campanhas (`/api/v1/campaigns`), Métricas (`/api/v1/metrics`) e Créditos (`/api/v1/checking_accounts`).
* **Repasse de Créditos:** Fluxo de APIs para consultar saldo e solicitar transferência de créditos do seller para investimento em anúncios.
* **SSO (Single Sign-On):** API (`POST /sso/marketplace`) que recebe dados do usuário/seller e retorna uma URL de redirecionamento para login automático na plataforma da Newtail.

### 6.2. Integração com VTEX (VTEX IO App)
Para lojas na plataforma VTEX, oferecemos um aplicativo que simplifica a implementação.

* **Instalação:** Adicione `vendor.newtail-media` como dependência no `manifest.json`, configure seu ID de publisher no admin e declare os blocos no tema.
* **Componentes:**
    * `newtail-media-banner`: Renderiza banners.
    * `newtail-media-shelf`: Renderiza uma prateleira de produtos patrocinados.
    * `newtail-media-search`: Adiciona selos "Patrocinado" nos resultados de busca.
    * `newtail-media-conversion`: Gerencia o envio de eventos de conversão.

### 6.3. Integração via Agent
Uma alternativa de implementação via script. Consiste em incluir um script no HTML e adicionar uma tag `<newtailad>` onde o anúncio deve ser exibido.

### 6.4. Integração com Digital Signage
Utilize a mesma API de consulta de anúncios com `context: 'digital_signage'` e o `device_id` obrigatório.

* **Telas Genéricas:** Solicite anúncios sem identificar um usuário.
* **Telas com Usuário Identificado (PDV):** Envie o `user_id` para receber anúncios personalizados.
* **Resposta:** A resposta para `digital_signage` contém um array de `assets` com `url`, `type` e `duration`, além do `impression_url`.
