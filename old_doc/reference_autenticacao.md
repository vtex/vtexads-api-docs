

# Autenticação

Será necessário autenticação para alguns endpoints na API, passando as
credenciais através do header da requisição.

> ## 📘
>
> Em alguns endpoints, como de notificação de eventos, não será necessário
> autenticação, pois poderá ser chamado direto do frontend durante a navegação
> do usuário.

Para os endpoints que necessitam de autenticação, as credenciais devem ser
enviadas no header da requisição http:

Atributo| Descrição  
---|---  
x-app-id| ID da Aplicação que vai fazer integração  
x-api-key| Chave de api para essa aplicação  
  
Abaixo exemplo de como essas credenciais devem ser enviadas.

###

Request

HTTP

    
    
    POST https://api-retail-media.newtail.com.br/v1/catalog HTTP/1.1
    accept: application/json
    content-type: application/json
    x-app-id: <PUBLISHER_APP_ID>
    x-app-key: <API_KEY>
    [
      {
        "sku": "120210",
        "name": "Notebook Samsung Intel Celeron-6305 NP550XDA-KP3BR 4GB 256GB SSD Tela 15,6\" Windows 11 - Cinza Chumbo",
        "url": "https://www.americanas.com.br/produto/4100903080",
        "image_url": "https://images-americanas.b2w.io/produtos/01/00/img/4100903/1/4100903143_1GG.jpg",
        "categories": ["Informática", "Notebooks"]
        "brand": "Samsung",
        "profit_magin": 0.1
      }
    
    ]  
    

Para obtenção dessas credenciais será necessário solicitação ao gerente /
executivo responsável pelo gerenciamento da sua conta de publisher na Newtail.

  * __Table of Contents
  *     * Request

