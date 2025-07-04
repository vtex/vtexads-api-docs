

# Digital Signage

A integração de Digital Signage utiliza a mesma API que é utilizada durante a
consulta de anúncios para a sua plataforma digital.

Documentação da API de Consulta de Anúncios [Requisição de
anúncios](/reference/requisicao-de-anuncios)

#

Consulta de Anúncios Para telas genéricas

> ## 📘
>
> Serão retornados todos os anúncios que devem ser exibidos.
>
> Uma vez que todos os anúncios forem exibidos, será necessário bater na API
> novamente para consultar o próximo lote de itens a serem exibidos.
>
> **Posso exibir o mesmo items duas vezes?**
>
> Não deve, pois as métricas de exibição só serão computadas uma única vez.

**Exemplo de requisição de anúncios**

    
    
    {
        "context": "digital_signage",
        "session_id": "random id",
        "device_id": "identificador da tela",
        "store_name": "identificador do local",
        "placements": {
            "nome_do_local_onde_está_a_tela": {
                "size": "1080x1920",
                "types": ["digital_signage"],
                "quantity": 1
            }
        },
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
    }
    

  

#

Consulta de Anúncios durante a venda no PDV

Em alguns casos, é possível identificar o usuário que está fazendo uma compra,
normalmente isso acontece durante o pagamento no PDV.

A partir do momento em que o usuário está identificado, é possível solicitar
um anúncio personalizado para aquele usuário.

> ## 📘
>
> Segmentações
>
> Para campanhas segmentadas, é necessária uma integração d audiências.
> [Integração de Audiências](/reference/integração)

Exemplo de Requisição d Anúncios

    
    
    {
        "context": "digital_signage",
        "user_id": "identifcador do usuário",
        "session_id": "random id",
        "device_id": "identificador único da tela",
        "store_name": "identificador único do local",
        "placements": {
            "nome_do_local_onde_está_a_tela": {
                "size": "1080x1920",
                "types": ["digital_signage"],
                "quantity": 5
            }
        },
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
    }
    

  

#

Resposta

**Atributos**

Atributo| Descrição| Tipo  
---|---|---  
assets| Endereço e Tipo da imagem/vídeo da campanha. Será retornado 1 ou mais
assets.| Array  
assets.#.url| Endereço do objeto que será exibido| String  
assets.#.type| Tipo do objeto  
  
\- image  
\- video| String  
assets.#.duration| Tempo de execução do Asset| Inteiro  
impression_url| URL de destino do evento de impressão| String  
  
**Payload**

    
    
    {
        "placement_name": [
            {
                "type": "digital_signage",
    
                "assets": [
                    {
                       "type": "image|video",
                       "url": "URL da imagem",
                       "duration": 30
                    }
                ],
    
                "impression_url": "URL DE IMPRESSÃO"
            }
        ]
    }
    

  * __Table of Contents
  *     * Consulta de Anúncios Para telas genéricas
    * Consulta de Anúncios durante a venda no PDV
    * Resposta

