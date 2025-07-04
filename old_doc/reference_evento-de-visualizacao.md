

# Visualização

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

Notificação de visualização

Exemplo de envio de visualização (somente para anúncios de banner) abaixo:

###

Request

HTTP

    
    
    POST https://newtail-media.newtail.com.br/v1/beacon/view/4a94bc6e-7db1-425f-8430-cb4d17488b3b?pos=1 HTTP/1.1
    accept: application/json
    content-type: application/json
    
    {
      "user_id": "6f92d1e9-00b6-4f8b-9645-faeab321e1cc",
      "session_id": "5898b8d1-c250-4bb5-931b-8b9d0ee7b499"
    }
     
    

###

Response

O retorno da requisição terá código HTTP 202

    
    
    {
    	"messages": [
    		"view will be processed soon"
    	]
    }
    

> O retorno de falha da requisição terá código HTTP 422
>
> O retorno dos erros implementa a RFC 8927
> <https://datatracker.ietf.org/doc/rfc8927/>

JSON

    
    
    [
      {
        instancePath: '',
        keyword: 'required',
        message: "must have required property 'user_id'",
        params: { missingProperty: 'user_id' },
        schemaPath: '#/anyOf/0/required',
      },
      {
        instancePath: '',
        keyword: 'required',
        message: "must have required property 'session_id'",
        params: { missingProperty: 'session_id' },
        schemaPath: '#/anyOf/1/required',
      },
      {
        instancePath: '',
        keyword: 'anyOf',
        message: 'must match a schema in anyOf',
        params: {},
        schemaPath: '#/anyOf',
      }
    ]
    

  * __Table of Contents
  *     * Notificação de visualização

