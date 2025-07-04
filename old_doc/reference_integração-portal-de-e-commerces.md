

# Marketplace

O objetivo deste documento é descrever como ocorre a integração entre a
Newtail e outros Marketplaces.

###

**Autenticação**

A autenticação ocorre em dois sentidos tanto do Marketplace para a Newtail,
quanto da Newtail para o Marketplace.

####

Marketplace para a Newtail

A conexão dependerá de adicionar dois parâmetros no header das requisições
feitas na Newtail.

Header| Descrição  
---|---  
x-app-id| O App ID identifica o usuário da API  
x-api-key| O Api Key identifica a "senha" da API  
  
> ## 📘
>
> As credenciais de acesso precisam ser solicitas para o nosso time de
> Customer Success

####

Newtail para o Marketplace

Neste cenário, a conexão será da Newtail para o Marketplace e afim de
padronizar essa integração, iremos utilizar o formato de autenticação de
**Basic Authentication** na requisição.

Autenticação| Descrição  
---|---  
usuário| Nome do usuário para a autenticação  
senha| Senha do Usuário  
  
> ## 📘
>
> Para mais informações do funcionamento do Basic Autentication, veja
> <https://datatracker.ietf.org/doc/html/rfc7617>

###

**Catálogo**

**Atributos:**

Atributo| Descrição| Tipo| Obrigatório?  
---|---|---|---  
product_sku| Identificador único do produto Pai| String| Sim  
name| Título do produto| String| Sim  
image_url| URL da imagem do produto pública, pode ser somente um thumbnail|
String| Não  
categories| Lista de Categorias| String| Sim  
brand| Nome da Marca do Produto| String| Sim  
gtins| Lista de EANs| Array| Não  
urls| Informações de URL do produto| Array| Sim  
urls.site| Nome da marca do site| String| Não  
urls.url| Url do produto| String| Sim  
stocks| Informações de estoques do produto| Array| Sim  
stocks.site| Nome da marca do site| String| Não  
stocks.seller_id| Identificador do seller id| String| Não  
stocks.quantity| Quantidade de estoque| Float| Sim  
metadada| Informações que serão retornadas durante a consulta de anúncios sem
nenhuma modificação| Object<String, String>| Não  
  
Nesta etapa, precisamos de uma API para consultar o catálogo do varejista e
esse catálogo deve conter:

Atributo| Descrição  
---|---  
seller_id| filtra pelo identificador do seller  
name| busca parcial pelo nome do produto  
skus| filtra por uma lista de skus  
eans| filtra por uma lista de eans  
quantity| quantidade de itens que devem ser retornados  
page| qual a página atual. inicia em 0 (zero)  
      
    
    GET PREFIXO/search?name=&seller_id=&skus=sku1,sku2,...,skuN&eans=ean1,ean2,...,eanN&quantity=&page=  
    
    Resposta
    Status: 200
    
    [  
      {  
        "product_sku": "teste-120210",  
        "name": "Notebook Samsung Intel Celeron-6305 NP550XDA-KP3BR 4GB 256GB SSD Tela 15,6\" Windows 11 - Cinza Chumbo",  
        "image_url": "https://images-americanas.b2w.io/produtos/01/00/img/4100903/1/4100903143_1GG.jpg",  
        "categories": ["Informática", "Notebooks"],  
        "brand": "Samsung",  
        "gtins": ["7898915633481"],
        "urls": [
          {
            "site": "site_name",
            "url": "https://www.americanas.com.br/produto/4100903080"
          }
        ],  
        "stocks": [
          {
            "site": "site_name",
            "seller_id": "xxxx",
            "quantity": 123.23
          }
        ],
        "metadata": {  
            "key": "value1"  
        }  
      }  
    ]
    

> ## 🚧
>
> Qualquer status diferente de 200 é considerado erro

###

**Anunciante (seller)**

Entidade Responsável por gerenciar os Anunciantes

Endpoints| Descrição| Filtros  
---|---|---  
GET /api/v1/advertisers| Busca Anunciantes| \- quantity - page - name -
seller_id  
POST /api/v1/advertisers| Cria um novo anunciante|  
GET /api/v1/advertisers/:seller_id| pega um anunciante pelo seller_id|  
PATCH /api/v1/advertisers/:seller_id| Atualiza um anunciante pelo seller_id|  
  
###

**Campanhas**

Entidade responsável por gerenciar as campanhas

Endpoints| Descrição| Filtros  
---|---|---  
GET /api/v1/campaigns| Lista campanhas| \- seller_id - page - quantity - name
- status - ad_type  
POST /api/v1/campaigns| Cria uma nova campanha|  
GET /api/v1/campaigns/:campaign_id| Pega uma campanha pelo ID|  
PATCH /api/v1/campaigns/:campaign_id| Atualiza uma campanha|  
  
###

**Métricas**

Consulta Métricas Macro e históricas.

Endpoints| Descrição| Filtros  
---|---|---  
GET /api/v1/metrics/macro/campaigns| Retorna métricas macro| \- start_at -
end_at - campaign_id - seller_id  
GET /api/v1/metrics/history/campaigns| Retorna métricas em formato histórico|
\- start_at - end_at - campaign_id - seller_id  
  
###

**Créditos**

Como adicionar ou remover créditos.

Endpoints| Descrição| Filtros  
---|---|---  
GET /api/v1/checking_accounts| Lista a conta de crédito dos anunciantes| \-
seller_id - page - quantity  
GET /api/v1/checking_accounts/:seller_id/transactions| Lista créditos de uma
conta| \- page - quantity  
POST /api/v1/checking_accounts/:seller_id/transactions| Adiciona Créditos a
uma conta|  
  
**Compra de Crédito com Cartão de Crédito/PIX**

Endpoints| Descrição| Filtro  
---|---|---  
GET /api/v1/payments| Lista pagamentos| \- seller_id - page - quantity  
POST /api/v1/payments/:payment_type| Cria um novo pagamento que irá adicionar
créditos|  
GET /api/v1/payments/:payment_id| Consulta um pagamento|  
  
###

SSO (autenticação na newtail)

A ideia é que uma vez o cliente conectado na plataforma do Marketplace, ele
possa re-utilizar esse login para conectar plataforma de Retail Media.

> ## 🚧
>
> Qualquer status diferente de 200 é considerado erro

**Login**

Para que isso seja possível, o login será feito através de token JWT com
SECRET compartilhada.  
Esse token deve conter:

  * publisher_id - Id do varejista na newtail
  * seller_ id - id do seller no marketplace
  * user_id - id do usuário no marketplace
  * Tempo de expiração de 24h

    
    
    GET https://app.newtail.com.br/login/marketplace?sso=JWT
    

**Consulta de Informações do Usuário**

Ter um endpoint para consultar um usuário pelo user id e deve retornar os
seguintes campos:

  * nome
  * email

    
    
    GET PREFIXO/users/:user_id?seller_id&=publisher_id=
    

**Consulta de Informações do Seller**

Ter um endpoint para consultar informações do seller:

  * nome
  * cnpj

    
    
    GET PREFIXO/sellers/:seller_id?publisher_id=
    

###

SSO v2 (autenticação na newtail)

A ideia dessa versão é permitir que o Varejista enviei a informações do Seller
e Usuário para uma api de autenticação da Newtail e a Newtail retorne a URL
pronta para redirecionar o usuário final para a plataforma.

> ## 🚧
>
> A autenticação seguirá o mesmo modelo
> [Autenticação](/reference/autenticacao)
    
    
    POST https://api-retail-media.newtail.com.br/sso/marketplace
    
    {
      "seller_id": "xyz",
      "seller_name": "Nome do Seller",
      "user_email": "[[email protected]](/cdn-cgi/l/email-protection)",
      "user_name": "Nome do Usuário"
    }
    

Sucesso - status 200

    
    
    {
      "url_redirect": "https://app.newtail.com.br/login/marketplace?token=JWT"
    }
    

**Falha**

status: 400 - erro de validação

    
    
    {
      "message": "ValidationError",
      "errors": []
    }
    

status: 500 - erro interno na aplicação

    
    
    {
      "message": "InternalServerError",
    }
    

  * __Table of Contents
  *     * **Autenticação**
      * Marketplace para a Newtail
      * Newtail para o Marketplace
    * **Catálogo**
    * **Anunciante (seller)**
    * **Campanhas**
    * **Métricas**
    * **Créditos**
    * SSO (autenticação na newtail)
    * SSO v2 (autenticação na newtail)

