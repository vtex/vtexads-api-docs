

# Conversão

> ##  🚧
>
> A URL do evento não deve ser "montada", sempre utilize a URL que chega a
> partir da consulta dos anúncios.
>
> Isso é super importante para garantirmos uma estabilidade da integração a
> longo prazo. Isso porque os parâmetros da URL do evento podem mudar ao longo
> do tempo, mas a integração não é alterada. Isso torna todo esse processo
> evolutivo, transparente para todos.

#

Informações básicas do pedido

Para envio das informações de catálogo é necessário o envio das informações
básicas de um produto. A tabela abaixo descreve quais campos são obrigatórios
e quais são opcionais nessa operação:

###

Order:

> ## 📘
>
> Campos Hash
>
> Os campos hash garantem a anonimidade dos dados dos usuários e elas permitem
> ter novas informaçoes sobre o usuário para que campanhas segmentadas e
> relatórios possam ser mais eficientes.
>
> Para saber como fazer o hash das informações, veja: <http://bit.ly/3WiL5ns>

Campo| Tipo| Descrição| Obrigatório?| Recomendado?  
---|---|---|---|---  
publisher_id| String| identificação do publisher| Sim|  
user_id| String| Identificação do usuário| Sim|  
session_id| String| Identificação da sessão que foi feita a compra, para
ajudar na atribuição da venda aos anúncios.| Sim|  
order_id| String| Identificação do pedido| Sim|  
email_hashed| String| Identificação do e-mail do usuário "Hasheado". | Sim|   
channel| String| Identifica o canal da conversão.| Sim|  
created_at| String| Data de criação do pedido em formato ISO 8601 (em UTC -
sem timezone)| Sim|  
items| Array[Item]| Listagem de itens comprados no pedido| Sim|  
is_company| Bool| Indica se a venda foi feita para pessoa física ou jurídica.  
default=false| Não| Sim  
gender| String| Indica qual o sexo do cliente.  
  
\- F: para feminino  
\- M: para masculino  
\- O: para outros  
\- null: para não identificadosDefault=null| Não| Sim  
uf| String| Indica o estado da compra do pedido| Não| Sim  
city| String| Indica qual o nome da cidade o cliente comprou|  Não| Sim  
phone_hashed| String| Identificação do Número de Telefone do usuário "Hasheado". | Não| Sim  
social_id_hashed| String| Identificação CPF ou CNPJ do usuário "Hasheado". | Não| Sim  
first_name_hashed| String| Identificação do Primeiro Nome do usuário "Hasheado". | Não| Sim  
last_name_hashed| String| Identificação do Último Nome do usuário "Hasheado". | Não| Sim  
  
###

Item:

Campo| Descrição| Tipo| Obrigatoriedade  
---|---|---|---  
sku| Identificação do sku do produto| String| Sim  
quantity| quantidade comprada do produto| Double| Sim  
price| Preço "de" do produto| Double| Sim  
promotional_price| Preço "por" do produto (preço com desconto)| Double| Sim  
seller_id| Identificação do seller id| String| Não  
product_id| Identificação única do produto que engloba o sku| String| Não  
  
#

Notificação de conversão

A notificação de conversão deve ser usado o endpoint de integração de pedidos,
que pode ser usado para notificar um ou mais pedidos (fazendo um lote de
envio).

O ideal é que seja notificado no momento do fechamento do pedido, tendo assim
a visão de venda colocada.

###

Request

> ## 🚧
>
> O preço e preço promocional não deve ser multiplicado pela quantidade.

HTTP

    
    
    POST https://newtail-media.newtail.com.br/v1/beacon/conversion HTTP/1.1
    accept: application/json
    content-type: application/json
    
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
          "seller_id": "1234",
          "product_id": "4567",
          "quantity": 1,
          "price": 2000.00, // note que não há multiplicação da quantidade com o valor
          "promotional_price": 1899.00 // note que não há multiplicação da quantidade com o valor
        },
        {
          "sku": "12222",
          "seller_id": null,
          "product_id": "4568",
          "quantity": 2,
          "price": 500.00, // note que não há multiplicação da quantidade com o valor
          "promotional_price": 400.00 // note que não há multiplicação da quantidade com o valor
        }
      ]
      "created_at": "2023-01-01T09:20:00Z"
    }
     
    

###

Response

> O retorno de sucesso da requisição terá código HTTP 202

JSON

    
    
    {
    	"messages": [
    		"conversion will be processed soon"
    	]
    }
    

> O retorno de falha da requisição terá código HTTP 422
>
> O retorno dos erros implementa a RFC 8927
> <https://datatracker.ietf.org/doc/rfc8927/>

JSON

    
    
    [
        {
            "instancePath": "",
            "keyword": "required",
            "message": "must have required property 'user_id'",
            "params": {
                "missingProperty": "user_id"
            },
            "schemaPath": "#/required"
        },
        {
            "instancePath": "",
            "keyword": "required",
            "message": "must have required property 'order_id'",
            "params": {
                "missingProperty": "order_id"
            },
            "schemaPath": "#/required"
        },
        {
            "instancePath": "",
            "keyword": "required",
            "message": "must have required property 'publisher_id'",
            "params": {
                "missingProperty": "publisher_id"
            },
            "schemaPath": "#/required"
        },
        {
            "instancePath": "",
            "keyword": "required",
            "message": "must have required property 'items'",
            "params": {
                "missingProperty": "items"
            },
            "schemaPath": "#/required"
        },
        {
            "instancePath": "",
            "keyword": "required",
            "message": "must have required property 'created_at'",
            "params": {
                "missingProperty": "created_at"
            },
            "schemaPath": "#/required"
        }
    ]
    

  * __Table of Contents
  *     * Informações básicas do pedido
    * Notificação de conversão

