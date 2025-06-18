# Documentação da Retail Media API da VTEX Ads

## Visão Geral

A **Retail Media API** é o ponto central de integração entre a solução de Retail Media da VTEX Ads e a plataforma do varejista, permitindo a exibição de anúncios para os consumidores. Esta API utiliza tecnologia REST e possibilita as seguintes operações:

* Sincronizar o catálogo de produtos.
* Requisitar anúncios para serem exibidos em seu e-commerce, marketplace ou aplicativo.
* Enviar notificações de eventos relacionados aos seus anúncios, como impressão, visualização, clique e conversão.

Atualmente, os formatos de anúncios disponíveis são **Produtos Patrocinados (Product Ads)** e **Banner Display (Banner Ads)**. Em breve, novos formatos inovadores estarão disponíveis.

---

## Glossário

* **Advertiser (anunciante):** Empresas, organizações ou indivíduos que promovem seus produtos, serviços ou ideias.
* **Publisher (varejista):** Entidade que possui e opera uma plataforma digital (site ou aplicativo) e disponibiliza espaço para anúncios.
* **Campanhas:** Ações disponibilizadas pelos anunciantes para gerar conversões (vendas).
* **Cliques:** Interação do usuário ao clicar em um anúncio.
* **Impressões:** Número de vezes que um anúncio é exibido.
* **Conversão:** Ação desejada gerada por um anúncio, como uma venda.
* **CTR (Click-Through Rate):** Taxa de cliques, calculada como `(Cliques / Impressões) * 100`. Mede a eficiência de um anúncio.
* **Custo:** Valor total investido em campanhas.
* **Receita/Vendas:** Valor total obtido com as vendas de produtos ou serviços.
* **ROAS (Return on Advertising Spend):** Retorno sobre o investimento em publicidade, calculado como `Receita Gerada por Anúncios / Custo da Publicidade`.
* **Taxa de conversão:** Percentual de conversões em relação ao total de visitantes ou interações.
* **Orçamento diário:** Valor máximo que um anunciante está disposto a investir por dia em uma campanha.
* **Receita com Anúncios:** Dinheiro ganho pelos varejistas ao venderem espaços para anunciantes.
* **Receita com vendas:** Valor total obtido por uma empresa a partir das vendas de produtos ou serviços.

---

## Boas Práticas de Integração

### Persistência HTTP

Para otimizar a integração do lado do servidor, recomendamos o uso de conexões HTTP persistentes. Isso reduz o overhead em cada chamada da API, reutilizando a mesma conexão para múltiplas requisições. Para implementar, adicione o header `Connection: keep-alive` às suas requisições.

### Implementação de Timeout

Para garantir a melhor experiência do usuário, mesmo em casos de instabilidade, sugerimos a implementação de um timeout entre 500-600ms em todas as requisições à API, especialmente nas de consulta de anúncios.

---

## Autenticação

Endpoints que necessitam de autenticação devem receber as credenciais via header HTTP.

| Atributo | Descrição |
| :--- | :--- |
| `x-app-id` | ID da aplicação que fará a integração. |
| `x-api-key` | Chave de API para essa aplicação. |

As credenciais devem ser solicitadas ao seu gerente de conta na VTEX Ads.

**Exemplo de Requisição Autenticada:**

```http
POST https://api-retail-media.newtail.com.br/product/bulk/products HTTP/1.1
accept: application/json
content-type: application/json
x-app-id: <PUBLISHER_APP_ID>
x-api-key: <API_KEY>

[
  {
    "product_sku": "teste-120210",
    ...
  }
]
````

-----

## Catálogo de Produtos

O primeiro passo da integração é a sincronização do catálogo de produtos, que ocorre em duas etapas:

1.  **Informações de produto:** Envio dos dados básicos dos produtos.
2.  **Informações de inventário:** Envio de preço, estoque e disponibilidade.

### 1\. Sincronização de Informações do Produto (API)

Para enviar ou atualizar informações de produtos, utilize o endpoint de inserção em lote.

**Endpoint:** `POST https://api-retail-media.newtail.com.br/product/bulk/products`

**Limites:** Máximo de 500 objetos por requisição e 3 requisições simultâneas.

**Campos do Produto:**

| Campo | Descrição | Tipo | Obrigatório? |
| :--- | :--- | :--- | :--- |
| `product_sku` | ID do produto a ser inserido/atualizado. | String | Sim |
| `parent_sku` | SKU do produto pai. | String | Não |
| `name` | Nome do produto. | String | Sim |
| `url` | URL da página do produto. | String | Sim |
| `image_url` | URL da imagem principal do produto. | String | Não |
| `categories` | Lista de categorias do produto. | Array[String] | Sim |
| `brand` | Marca do produto. | String | Não |
| `gtins` | Código de barras. **Obrigatório para VTEX Ads Network.** | Array[String] | Não/Sim |
| `metadata` | Informações adicionais do produto. | Object | Não |
| `tags` | Lista de "marcações" para contextualizar a busca de anúncios. Máx. 10 por SKU, 64 caracteres por tag. **Só funciona para campanhas de Produtos.** | Array[String] | Não |
| `sellers` | Lista de anunciantes que vendem o produto. Máx. 64 caracteres por seller. | Array[String] | Não |

**Exemplo de Requisição:**

```json
[
  {
    "product_sku": "teste-120210",
    "name": "Notebook Samsung Intel Celeron-6305",
    "url": "[https://www.site.com.br/produto/4100903080](https://www.site.com.br/produto/4100903080)",
    "image_url": "[https://images.site.com.br/produtos/01/00/img/4100903/1/4100903143_1GG.jpg](https://images.site.com.br/produtos/01/00/img/4100903/1/4100903143_1GG.jpg)",
    "categories": ["Informática", "Notebooks"],
    "brand": "Samsung",
    "gtins": ["7898915633481"],
    "metadata": { "key": "value1" }
  }
]
```

A resposta de sucesso será um `HTTP 202` com a mensagem de que os produtos serão processados. Erros de validação retornarão `HTTP 422` com detalhes no formato da [RFC 8927](https://datatracker.ietf.org/doc/rfc8927/).

### 2\. Sincronização de Inventário

Atualiza preço e disponibilidade dos produtos.

**Endpoint:** `POST https://api-retail-media.newtail.com.br/product/bulk/inventories`

**Limites:** Idênticos à sincronização de produtos.

**Campos de Inventário:**

| Campo | Descrição | Tipo | Obrigatório? |
| :--- | :--- | :--- | :--- |
| `product_sku` | ID do produto. | String | Sim |
| `store_id` | Identificação da loja. Se não informado, aplica-se a todas. | String | Não |
| `price` | Preço do produto. | Number | Sim |
| `promotional_price`| Preço promocional. | Number | Sim |
| `is_available` | Indica se o produto está disponível para venda. | Boolean | Sim |

**Exemplo de Requisição:**

```json
[
  {
    "product_sku": "120210",
    "store_id": "1",
    "price": 18.20,
    "promotional_price": 16.32,
    "is_available": true
  }
]
```

-----

## Consulta de Anúncios

A API de consulta de anúncios retorna formatos de Produtos e Banners. A requisição é um `POST` para `https://VTEX Ads-media.newtail.com.br/v1/rma/:publisher_id`.

### Parâmetros da Requisição

| Campo | Descrição | Tipo | Obrigatoriedade |
| :--- | :--- | :--- | :--- |
| `session_id` | Identificador único da sessão do usuário (apenas alfanuméricos). | String | Sim |
| `user_id` | Identificador único do usuário (apenas alfanuméricos). | String | Não |
| `context` | Contexto de exibição do anúncio (`home`, `category`, `search`, `product_page`, `brand_page`). | String | Sim |
| `channel` | Canal de acesso do cliente (`site`, `msite`, `app`). | String | Sim |
| `term` | Termos de busca. | String | Somente para contexto `search` |
| `category_name`| Nome da categoria (breadcrumb completo, ex: `Categoria > Subcategoria`). | String | Somente para contexto `category` |
| `placements` | Objeto que define os espaços de anúncio na página. A chave é o nome do placement. | Object | Sim |
| `placements.{name}.quantity` | Quantidade de anúncios para o placement. | Integer | Sim |
| `placements.{name}.size` | Tamanho do anúncio esperado (ex: `desktop`, `mobile`). | String | Sim |
| `placements.{name}.types` | Tipos de anúncios permitidos (`product`, `banner`, `sponsored_brand`, `digital_signage`). | Array[String] | Sim |
| `segmentation` | Permite segmentação em tempo real com base em dados do usuário (idade, gênero, etc.). Veja a seção "Segmentação de Campanhas". | Array[Object] | Não |

### Nomes de Placements

Para uma medição eficaz, sugerimos o padrão `{meio}_{contexto}_{posicao}_{tipo}` para nomear os placements.

**Exemplos:**

| meio | contexto | posição | tipo | Resultado |
| :--- | :--- | :--- | :--- | :--- |
| `site` | `home` | `middle` | `banner` | `site_home_middle_banner` |
| `msite` | `product` | `top-vitrine` | `product` | `msite_product_top-vitrine_product` |
| `app` | `search` | `top-vitrine` | `banner` | `app_search_top-vitrine_banner` |

### Resposta da Consulta de Anúncios

A resposta é um dicionário onde cada chave é um nome de placement.

| Campo | Descrição | Tipo |
| :--- | :--- | :--- |
| `{placementName}.#.ad_id` | ID único do anúncio. | String |
| `{placementName}.#.media_url` | URL da mídia a ser exibida. | String |
| `{placementName}.#.destination_url` | URL de destino do anúncio. | String |
| `{placementName}.#.type` | Tipo do anúncio (`banner`, `product`, etc.). | String |
| `{placementName}.#.click_url` | URL para notificar o evento de clique. | String |
| `{placementName}.#.impression_url` | URL para notificar o evento de impressão. | String |
| `{placementName}.#.view_url` | URL para notificar o evento de visualização. | String |
| `{placementName}.#.product_sku` | SKU do produto (para anúncios de produto). | String |

-----

## Notificação de Eventos

É crucial notificar eventos para medir a performance das campanhas. **Sempre utilize a URL de evento fornecida na resposta da consulta de anúncios.**

### Identificação de Usuário e Sessão

  * **`session_id`:** Identificador da sessão do usuário, obrigatório em todos os eventos.
  * **`user_id`:** Identificador único do cliente, o mesmo em todos os canais. Obrigatório no evento de conversão.

### Eventos de Impressão, Visualização e Clique

O envio é feito através de uma requisição `POST` para a respectiva URL de evento (`impression_url`, `view_url`, `click_url`) com o `user_id` e `session_id` no corpo da requisição.

**Exemplo de Requisição de Impressão:**

```http
POST [https://VTEX Ads-media.newtail.com.br/v1/beacon/impression/4a94bc6e-7db1-425f-8430-cb4d17488b3b?pos=1](https://VTEX Ads-media.newtail.com.br/v1/beacon/impression/4a94bc6e-7db1-425f-8430-cb4d17488b3b?pos=1) HTTP/1.1
Content-Type: application/json

{
  "user_id": "6f92d1e9-00b6-4f8b-9645-faeab321e1cc",
  "session_id": "5898b8d1-c250-4bb5-931b-8b9d0ee7b499"
}
```

A resposta de sucesso é um `HTTP 202`.

### Evento de Conversão

A notificação de conversão é feita para o endpoint `POST https://VTEX Ads-media.newtail.com.br/v1/beacon/conversion`.

**Campos Principais do Pedido (`Order`):**

| Campo | Descrição | Tipo | Obrigatório? |
| :--- | :--- | :--- | :--- |
| `publisher_id` | Identificação do publisher. | String | Sim |
| `user_id` | Identificação do usuário. | String | Sim |
| `session_id` | Identificação da sessão da compra. | String | Sim |
| `order_id` | Identificação do pedido. | String | Sim |
| `email_hashed` | E-mail do usuário "hasheado" (SHA256). | String | Sim |
| `channel` | Canal da conversão. | String | Sim |
| `created_at` | Data de criação do pedido (ISO 8601 em UTC). | String | Sim |
| `items` | Lista de itens comprados. | Array[Item] | Sim |

**Campos do Item:**

| Campo | Descrição | Tipo | Obrigatório? |
| :--- | :--- | :--- | :--- |
| `sku` | ID do SKU do produto. | String | Sim |
| `quantity` | Quantidade comprada. | Double | Sim |
| `price` | Preço "de" do produto. | Double | Sim |
| `promotional_price`| Preço "por" do produto. | Double | Sim |

**Exemplo de Requisição de Conversão:**

```json
{
  "channel": "ecommerce",
  "publisher_id": "xxx",
  "user_id": "6f92d1e9-00b6-4f8b-9645-faeab321e1cc",
  "session_id": "5898b8d1-c250-4bb5-931b-8b9d0ee7b499",
  "order_id": "123",
  "email_hashed": "xyz",
  "items": [
    {
      "sku": "12221",
      "quantity": 1,
      "price": 2000.00,
      "promotional_price": 1899.00
    }
  ],
  "created_at": "2023-01-01T09:20:00Z"
}
```

-----

## Segmentação de Campanhas

A segmentação permite priorizar campanhas para públicos específicos em tempo real. As informações podem ser enviadas diretamente na consulta de anúncios ou associadas a um `user_id`.

### Atributos de Segmentação

  * `AGE`: Idade
  * `GENDER`: Gênero (`F`, `M`, `O`)
  * `STATE`: UF do estado
  * `CITY`: Nome da cidade
  * `AUDIENCES`: Audiências customizadas
  * `NBO_CATEGORIES`: Categorias de intenção de compra

### Envio de Segmentação na Requisição

Adicione o campo `segmentation` ao corpo da requisição de consulta de anúncios.

```json
"segmentation": [
  { "key": "AGE", "values": ["22"] },
  { "key": "STATE", "values": ["SP"] }
]
```

-----

## Integração de Audiências

Para usar segmentação baseada em `user_id`, é necessário integrar os dados de audiência. A integração ocorre via envio de arquivos `Parquet` com compressão `Snappy` para um S3 da VTEX Ads.

### Hash de Dados Confidenciais

Campos PII (Informações de Identificação Pessoal) como e-mail, telefone, CPF, nome, etc., devem ser criptografados com o algoritmo **SHA256** antes do envio.

**Pré-processamento antes do Hash:**

1.  Remover todos os espaços.
2.  Converter para **minúsculo**.
3.  Para telefones (`PHONE_HASHED`), formatar no padrão E.164 (ex: `+5511987654321`).

-----

## Exportação de Dados

### Exportação de Eventos e Dados Agregados

A VTEX Ads pode exportar dados de eventos (impressões, cliques, etc.) e dados agregados (relatórios de campanhas, anunciantes) para um bucket S3, Google Cloud Storage ou Azure Blob Storage fornecido pelo cliente.

  * **Formato de Eventos:** Parquet + Snappy.
  * **Formato de Dados Agregados:** CSV.
  * **Frequência:** Diária (dados de D-1).

### Exportação de Relatórios via API

É possível exportar relatórios via API, que retornam JSON por padrão, mas podem ser baixados como XLSX (`download=true`). O acesso depende do tipo de conta.

**Endpoints de Relatórios:**

  * `GET /report/v2/advertisers`: Informações de anunciantes (visão do publisher).
  * `GET /report/v2/publishers`: Informações do publisher (visão do anunciante).
  * `GET /report/network/publishers`: Publishers da rede (para contas do tipo Rede).
  * `GET /campaign/v2`: Relatório de campanhas.
  * `GET /ad/results/v2`: Relatório de anúncios.

-----

## Integração com Marketplace

A documentação descreve endpoints e fluxos específicos para a integração entre a VTEX Ads e plataformas de Marketplace, cobrindo:

  * **Autenticação:** Bidirecional (Marketplace \<\> VTEX Ads).
  * **Catálogo:** API para consulta de produtos do marketplace.
  * **Gerenciamento:** Endpoints para gerenciar Anunciantes, Campanhas e Créditos.
  * **SSO (Single Sign-On):** Para uma experiência de login unificada.
  * **Repasse:** Endpoints para transferência de crédito do seller para anúncios.

-----

## Integração com VTEX (VTEX Ads Media APP)

Para lojas na plataforma VTEX, a VTEX Ads oferece um aplicativo que simplifica a implementação.

**Passos de Instalação:**

1.  Adicionar `vendor.VTEX Ads-media` como dependência no `manifest.json` do tema.
2.  Configurar o ID do publisher no admin da VTEX.
3.  Declarar os blocos do app no tema.

**Componentes Disponíveis:**

  * `VTEX Ads-media-banner`: Renderiza banners patrocinados.
  * `VTEX Ads-media-shelf`: Renderiza uma prateleira de produtos patrocinados.
  * `VTEX Ads-media-search`: Adiciona selos "Patrocinado" aos resultados de busca.
  * `VTEX Ads-media-conversion`: Gerencia o envio de eventos de conversão.

-----

## Digital Signage

A integração de Digital Signage (telas digitais) utiliza a mesma API de consulta de anúncios, com o contexto `digital_signage`. É possível solicitar anúncios genéricos para uma tela ou anúncios personalizados quando um usuário é identificado (ex: no PDV).

-----

## VTEX Ads Agent

O VTEX Ads Agent é uma alternativa de integração via script que simplifica a exibição de anúncios em cenários específicos. Consiste em incluir um script no HTML e adicionar uma tag `<VTEX Adsad>` onde o anúncio deve ser exibido.

```