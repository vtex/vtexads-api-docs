# Notificação de eventos

Para que consigamos medir o resultado efetivo das campanhas, além de conseguir
cobrar efetivamente pelos anúncios, seja cobrança por clique (CPC), por
impressão (CPM) ou por conversão (CPA), precisamos receber notificação quando
cada uma desses eventos dos anúncios acontecem.

Abaixo temos a lista de eventos necessários que precisam ser enviados:

  * Impressões
  * Visualização (somente para banner)
  * Cliques
  * Conversões

As seções abaixo tratam do envio das notificações, executando a de conversão,
que tem a peculiaridade de ter q receber as informações do pedido efetuado.
Trataremos isso na seguinte página: [Evento de conversão](/reference/evento-
de-conversao)

> ## 🚧
>
> A URL do evento não deve ser "montada", sempre utilize a URL que chega a
> partir da consulta dos anúncios.
>
> Isso é super importante para garantirmos uma estabilidade da integração a
> longo prazo. Isso porque os parâmetros da URL do evento podem mudar ao longo
> do tempo, mas a integração não é alterada. Isso torna todo esse processo
> evolutivo, transparente para todos.

#

Envio de eventos (Navegador)

Nossa sugestão, para envio de notificação em ambiente web (navegador), é que
seja usado método de envio de dados **sendBeacon()** , pois é a forma mais
moderna de notificação de informação de dados. A grande vantagem de usar
sendBeacon é que a request é realmente assíncrona, não bloqueia o carregamento
da página atual e nem da próxima página.

Usando o seguinte retorno de uma requisição de anúncios:

JSON

    
    
    {
      "products": [
        {
          "ad_id": "4a94bc6e-7db1-425f-8430-cb4d17488b3b",
          "sku": "120210",
          "click_url": "https://newtail-media.newtail.com.br/v1/beacon/click/4a94bc6e-7db1-425f-8430-cb4d17488b3b?pos=1",
          "impression_url": "https://newtail-media.newtail.com.br/v1/beacon/impression/4a94bc6e-7db1-425f-8430-cb4d17488b3b?pos=1",
        },
        {
          "ad_id": "8c293205-52f4-45cf-9a01-37e7c26a5abc",
          "sku": "123123",
          "click_url": "https://newtail-media.newtail.com.br/v1/beacon/click/8c293205-52f4-45cf-9a01-37e7c26a5abc?pos=2",
          "impression_url": "https://newtail-media.newtail.com.br/v1/beacon/impression/8c293205-52f4-45cf-9a01-37e7c26a5abc?pos=2",
        }
      ],
      "banners": []
    }
    

Podemos pegar o **impression_url** do primeiro anúncio, e usar da seguinte
forma:

JavaScript

    
    
    let user_data = {
       user_id: "6f92d1e9-00b6-4f8b-9645-faeab321e1cc",
       session_id: "5898b8d1-c250-4bb5-931b-8b9d0ee7b499"
    }
    
    let url_do_beacon =  "https://newtail-media.newtail.com.br/v1/beacon/impression/4a94bc6e-7db1-425f-8430-cb4d17488b3b?pos=1"
    
    var jsonBlob = new Blob([JSON.stringify(user_data)], { type: 'application/json' });
    
    navigator.sendBeacon(url_do_beacon, jsonBlob);
    

#

Envio de eventos (Server side ou APP nativo)

Nesses casos de envio via server side ou por um app nativo, a questão é enviar
uma requisição POST para a url do evento, passando as informações do usuário e
sessão no payload.

Exemplo de envio de impressão abaixo:

###

Request

HTTP

    
    
    POST https://newtail-media.newtail.com.br/v1/beacon/impression/4a94bc6e-7db1-425f-8430-cb4d17488b3b?pos=1 HTTP/1.1
    user-agent: newtail
    accept: application/json
    content-type: application/json
    
    {
      "user_id": "6f92d1e9-00b6-4f8b-9645-faeab321e1cc",
      "session_id": "5898b8d1-c250-4bb5-931b-8b9d0ee7b499"
    }
     
    

###

Response

> O retorno da requisição terá código HTTP 202 e sem body

  * __Table of Contents
  *     * Envio de eventos (Navegador)
    * Envio de eventos (Server side ou APP nativo)

