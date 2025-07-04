

# Sincronização de catálogo por API

#

Informações básicas do produto

Para envio das informações de catálogo é necessário o envio das informações
básicas de um produto. A tabela abaixo descreve quais campos são obrigatórios
e quais são opcionais nessa operação:

Campo| Descrição| Tipo| Obrigatório?  
---|---|---|---  
product_sku| Id do produto a ser inserido / atualizado.| String| Sim  
parent_sku| Sku do produto pai| String| Não  
name| Nome do produto.| String| Sim  
url| Url da página do produto.| String| Sim  
image_url| Url da imagem principal do produto.| String| Não  
categories| Lista de categorias do produto.| Array[String]| Sim  
brand| Marca do produto.| String| Não  
gtins| Código de barras  
  
**em caso de Newtail Network é obrigatório o envio do GTIN**|  Array[String]|
Não/Sim  
metadata| Informações adicionais do produto| Object| Não  
tags| É uma lista de "marcações" que os produtos possuem para serem utilizamos
posteriormente durante a consulta de anúncios para contextualizar melhor a
busca.  
  
\- Máximo de 10 Tags por SKU  
\- Máximo de 64 caracteres por Tag**Só funciona para campanhas de Produtos**|
Array[String]| Não  
sellers| Lista de anunciantes que vendem aquele produto  
  
\- Máximo de 64 caracteres por Seller| Array[String]| Não  
  
  

#

Inserção e atualização de produtos no catálogo

Para atualização dos dados básicos dos produtos, será necessário utilizar o
seguinte endpoint:

> ## 🚧
>
> Inserção / Atualização em Lote
>
> Para cada lote de inserção / atualização em lote, será permitido, no máximo,
> o envio de 500 objetos por requisição e 3 requisições simultâneas.
>
> Então para uma carga inicial com base de produtos inteira, precisa-se
> verificar esse limite no envio.

###

Request

O processamento será executado de forma assíncrona.

HTTP

    
    
    POST https://api-retail-media.newtail.com.br/product/bulk/products HTTP/1.1
    accept: application/json
    content-type: application/json
    x-app-id: <PUBLISHER_APP_ID>
    x-api-key: <API_KEY>
    
    [
        {
        "product_sku": "teste-120210",
        "name": "Notebook Samsung Intel Celeron-6305 NP550XDA-KP3BR 4GB 256GB SSD Tela 15,6\" Windows 11 - Cinza Chumbo",
        "url": "https://www.americanas.com.br/produto/4100903080",
        "image_url": "https://images-americanas.b2w.io/produtos/01/00/img/4100903/1/4100903143_1GG.jpg",
        "categories": ["Informática", "Notebooks"],
        "brand": "Samsung",
        "gtins": ["7898915633481"],
        "metadata": {
            "key": "value1"
        }
      },
      {
        "product_sku": "teste-120211",
        "name": "Notebook Samsung Intel Celeron-6305 NP550XDA-KP3BR 4GB 256GB SSD Tela 15,6\" Windows 11 - Cinza Chumbo",
        "url": "https://www.americanas.com.br/produto/4100903080",
        "categories": ["Informática", "Notebooks"],
        "brand": "Samsung",
        "gtins": ["7898915633481"],
        "tags": ["Mega Maio"]
      }
    ]
    

###

Response

> O retorno da requisição terá código HTTP 202

JSON

    
    
    {
    	"messages": [
    		"products will be processed soon"
    	]
    }
    

###

Response com erro de Validação

Para as validações, utilizamos o formato da RFC
8927<https://datatracker.ietf.org/doc/rfc8927/>

O retorno da requisição terá código HTTP 422

JSON

    
    
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
    

  * __Table of Contents
  *     * Informações básicas do produto
    * Inserção e atualização de produtos no catálogo

