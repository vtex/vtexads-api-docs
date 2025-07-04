

# Segmentação de Campanhas

A segmentação de campanhas permite que durante uma consulta de anúncios, seja
informada algumas meta-informações que podem ser utilizadas em tempo real para
priorizar campanhas que sejam para aquele público específico.

As campanhas que possuem segmentação terão maior prioridade durante o processo
de consulta, o que significa que elas são consideradas mais relevantes para o
público ao qual foram direcionadas. No entanto, a presença de segmentação não
impede que campanhas não segmentadas também sejam exibidas.

> ## 🚧
>
> Prioriza campanhas com segmentação!
>
> Campanhas com segmentação terão maior relevância durante a consulta de
> anúncios, mas isso não obriga que somente campanhas segmentadas serão
> retornadas.

#

Atributos de Segmentação

Os atributos são os tipos de informação que o público pode ter e
consequentemente que uma campanha pode ter durante a sua criação.

Atributo| Descrição  
---|---  
AGE| indica a idade  
GENDER| indica o gênero  
  
\- F: para feminino  
\- M: para masculino  
\- O: para outros  
STATE| UF dos estados  
CITY| Nome da Cidade  
AUDIENCES| As audiências são informações previamente criadas e totalmente
customizadas  
NBO_CATEGORIES| Indica quais as possíveis categorias que o usuário tem
intenção de comprar  
  
  

#

Busca de anúncios com Segmentação

Durante a solicitação de anúncios, as informações de segmentação podem ser
enviadas de duas formas: diretamente no corpo da requisição ou com base nas
audiências associadas a um _user_id_.

##

Envio de Segmentação no Corpo da Requisição (segmentation)

Nesta abordagem, as informações de segmentação são enviadas diretamente no
corpo da requisição, no campo "segmentation". Esses dados são priorizados em
relação às informações que poderiam ser obtidas com base no user_id,
permitindo uma personalização mais detalhada e temporária, de acordo com as
condições da consulta de anúncios.

###

Request

HTTP

    
    
    POST https://newtail-media.newtail.com.br/v1/rma/:publisher_id HTTP/1.1
    Content-Type: application/json
    
    {
        "context": "search",
        "term": "desodorante",
        "session_id": "f361661f-5986-4779-9009-a34562f18347",
        "tags": ["Mega Maio"],
        "placements": {
            "nomePlacement1": { "quantity": 3, "size": "desktop", "types": ["banner"] }
        },
        "segmentation": [
            {
                "key": "AGE",
                "values": ["22"]
            },
            {
                "key": "STATE",
                "values": ["SP"]
            }
        ]
    }
    

##

Segmentação com Base no _user_id_

Nesta abordagem, as informações de segmentação são obtidas com base nas
audiências associadas ao "user_id". Essas audiências devem ter sido
previamente importadas para o sistema (ver seção Integração de Audiências). Ao
utilizar essa abordagem, não é necessário enviar dados no campo "segmentation"
(visto que esse campo tem prioridade sobre "user_id"), pois o sistema
automaticamente buscará as audiências associadas ao usuário.

###

Request

HTTP

    
    
    POST https://newtail-media.newtail.com.br/v1/rma/:publisher_id HTTP/1.1
    Content-Type: application/json
    
    {
        "context": "search",
        "term": "desodorante",
        "user_id": "6a746448-cf59-42bc-aa3d-a426844ad115",
        "session_id": "f361661f-5986-4779-9009-a34562f18347",
        "tags": ["Mega Maio"],
        "placements": {
            "nomePlacement1": { "quantity": 3, "size": "desktop", "types": ["banner"] }
        }
    }
    

  * __Table of Contents
  *     * Atributos de Segmentação
    * Busca de anúncios com Segmentação
      * Envio de Segmentação no Corpo da Requisição (segmentation)
      * Segmentação com Base no _user_id_

