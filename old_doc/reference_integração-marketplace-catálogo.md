

# Catálogo

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
product_sku| Identificador do sku| String| Sim  
product_id| Identificador do Produto pai| String| Sim  
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
esse catálogo deve conter o seguinte filtro via query params:

Obs.: Array são separados por vírgula

Atributo| Descrição| Tipo| Obrigatório?  
---|---|---|---  
seller_id| filtra pelo identificador do seller| String| Sim  
name| busca parcial pelo nome do produto| String| Sim  
ids| filtra por uma lista de product_sku/product_id| Array| Sim  
quantity| quantidade de itens que devem ser retornados. Máximo 1000| Integer|
Sim  
page| qual a página atual. inicia em 0 (zero)| Integer| Sim  
eans| filtra por uma lista de eans| Array| Não  
      
    
    GET PREFIXO/search?name=&seller_id=&ids=sku1,sku2,...,skuN&eans=ean1,ean2,...,eanN&quantity=&page=  
    
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

  *  __Table of Contents
  *     *       * Newtail para o Marketplace
    * **Catálogo**

