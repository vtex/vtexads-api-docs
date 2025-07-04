

# Sincronização de Inventário

#

Informações de Inventário

As informações de inventário definem o preço, preço promotional e "estoque".
No caso do estoque, só devemos receber se o produto está disponível para
venda.

Campo| Descrição| Tipo| Obrigatório?  
---|---|---|---  
product_sku| Id do produto a ser inserido / atualizado.| String| Sim  
store_id| Identificação da loja. Caso não seja enviado o store_id, será
interpretado que essa informação de inventário será utilizado para todas as
lojas.| String| Não  
price| Preço do produto| Number| Sim  
promotional_price| Preço promocional do produto.| Number| Sim  
is_available| Indica se o produto está disponível para venda| Boolean| Sim  
  
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

    
    
    POST https://api-retail-media.newtail.com.br/product/bulk/inventories HTTP/1.1
    accept: application/json
    content-type: application/json
    x-app-id: <PUBLISHER_APP_ID>
    x-api-key: <API_KEY>
    
    [
      {
        "product_sku": "120210",
        "store_id": "1",
        "price": 18.20,
        "promotional_price": 16.32,
        "is_available": true
      },
      {
        "product_sku": "120212",
        "price": 18.20,
        "promotional_price": 0, // isso remove o preço promocional
        "is_available": true
      }
    ]  
    

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
        params: {
          missingProperty: 'product_sku'
        },
        message: "must have required property 'product_sku'"
      },
      {
        instancePath: '/0',
        schemaPath: '#/items/required',
        keyword: 'required',
        params: {
          missingProperty: 'promotional_price'
        },
        message: "must have required property 'promotional_price'"
      },
      {
        instancePath: '/0',
        schemaPath: '#/items/required',
        keyword: 'required',
        params: {
          missingProperty: 'is_available'
        },
        message: "must have required property 'is_available'"
      },
      {
        instancePath: '/1',
        schemaPath: '#/items/required',
        keyword: 'required',
        params: {
          missingProperty: 'price'
        },
        message: "must have required property 'price'"
      },
      {
        instancePath: '/1',
        schemaPath: '#/items/required',
        keyword: 'required',
        params: {
          missingProperty: 'promotional_price'
        },
        message: "must have required property 'promotional_price'"
      },
      {
        instancePath: '/1',
        schemaPath: '#/items/required',
        keyword: 'required',
        params: {
          missingProperty: 'is_available'
        },
        message: "must have required property 'is_available'"
      },
      {
        instancePath: '/2',
        schemaPath: '#/items/required',
        keyword: 'required',
        params: {
          missingProperty: 'price'
        },
        message: "must have required property 'price'"
      },
      {
        instancePath: '/2',
        schemaPath: '#/items/required',
        keyword: 'required',
        params: {
          missingProperty: 'is_available'
        },
        message: "must have required property 'is_available'"
      }
    ]
    

  * __Table of Contents
  *     * Informações de Inventário

