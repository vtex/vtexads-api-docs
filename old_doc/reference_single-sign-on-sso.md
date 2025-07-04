

# Single Sign On (SSO)

O objetivo de Single Sign On, é permitir que o usuário mude de ambientes sem
que precise se logar novamente.

> ## 📘
>
> Autenticação da API
>
> <https://dash.readme.com/project/newtail-media/v1.0/refs/autenticacao>

  

#

1\. Solicitar URL de redirecionamento

Atributo| Descrição| Tipo| Obrigatório?  
---|---|---|---  
seller_id| Indica o identificador único do anunciante/seller| String| Sim  
seller_name| Nome do anunciante/seller| String| Sim  
user_email| E-mail do usuário| String| Sim  
user_name| Nome do usuário| String| Sim  
      
    
    curl --location --request POST 'https://api-retail-media.newtail.com.br/sso/marketplace'  
    --header 'x-api-key: XXX'  
    --header 'x-app-id: YYY'  
    --header 'Content-Type: application/json'  
    --data-raw '{  
      "seller_id": "1",
      "seller_name": "Store Example",  
      "user_email": "[[email protected]](/cdn-cgi/l/email-protection)",  
      "user_name": "User Example"  
    }'
    

Resposta:

    
    
    {  
        "url_redirect": "https://app.newtail.com.br/login/marketplace?token=xxxxx"  
    }
    

  

#

2\. Redirecionamento do Usuário para a URL de redirecionamento

Uma vez com a URL de redirecionamento na mão, basta redirecionar o usuário
para essa URL que o usuário irá entrar logado na plataforma sem precisar ter
nenhuma integração com Login.

  

#

URL de Login (desconexão de usuário)

De forma opcional, podemos redirecionar o usuário para uma URL informada
previamente que será utilizada quando o usuário for desconectado.

  * __Table of Contents
  *     * 1\. Solicitar URL de redirecionamento
    * 2\. Redirecionamento do Usuário para a URL de redirecionamento
    * URL de Login (desconexão de usuário)

