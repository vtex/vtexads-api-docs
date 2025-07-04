

# Repasse

O repasse do marketplace é importante para que seja possível transferir o
crédito do seller diretamente para que ele possa fazer os anúncios.

> ## 📘
>
> Modelo de autenticação [Basic Auth](/reference/integra%C3%A7%C3%A3o-portal-
> de-e-commerces#newtail-para-o-marketplace)

Para isso precisamos da criação de 2 endpoints do lado do marketplace e uma
chamada para o webhook de status da transferência.

###

Consulta de saldo (endpoint 1)

Consultar o saldo disponível para repasse do marketplace do seller.

####

Parâmetros:

  * id do varejista
  * id do seller

    
    
    GET PREFIXO/checking_account?seller_id&=publisher_id=  
    
    Resposta:
    Status: 200
    
    {
      "total": "1111.00"
    }
    
    

> ## 🚧
>
> Qualquer status diferente de 200 é considerado erro

###

Solicitar Transferência (endpoint 2)

Solicitar uma transferência de um valor específico.

####

Parâmetros:

  * id do varejista
  * id do seller
  * valor (vamos enviar o valor como string para garantir a precisão)
  * id único da transação (se já existir uma transação criada com mesmo id, não deve criar uma nova)

    
    
    POST PREFIXO/checking_account/transfer
    
    {
      "amount": "10.00",
      "seller_id": "",
      "publisher_id": "",
      "transfer_identity_id": "uuid"
    }
    
    Resposta com sucesso
    Status: 201
    {
      "transaction_id": ""
    }
    
    
    Resposta erro
    Status: 400
    {
      "message": "descrição do erro"
    }
    
    

> ## 🚧
>
> Qualquer status diferente de 200 é considerado erro

###

Webhook

> ## 📘
>
> Modelo de autenticação [Api Key e Secret
> Key](/reference/integra%C3%A7%C3%A3o-portal-de-e-commerces#marketplace-para-
> a-newtail)

Enviar webhook da execução da transação confirmando o sucesso ou a falha da
transferência.

    
    
    POST <https://api-retail-media.newtail.com.br/webhook/marketplace/transfers/:publisher_id>  
    
    Sucesso na transferência:
    {
      "amount": "10.00",
      "seller_id": "",
      "publisher_id": "",
      "transfer_identity_id": "uuid",
      "status": "success"
    }
    
    Falha na transferência
    {
      "amount": "10.00",
      "seller_id": "",
      "publisher_id": "",
      "transfer_identity_id": "uuid",
      "status": "failure",
      "message": "descrição do problema"
    }
    
    Resposta com sucesso:
    Status: 204 ou 202
    
    Resposta com erro:
    Status: 422 - problema na validação dos dados enviados
    Status: XXX - qualquer outro problema gerado internamente
    
    

> ## ❗️
>
> Para qualquer erro na resposta do WEBHOOK deve continuar retentando o envio
> dos dados.

  * __Table of Contents
  *     * Consulta de saldo (endpoint 1)
      * Parâmetros:
    * Solicitar Transferência (endpoint 2)
      * Parâmetros:
    * Webhook

