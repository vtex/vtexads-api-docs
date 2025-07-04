

# Exportação de Relatórios

A exportação de relatórios permite acessar e baixar informações da plataforma
de forma automatizada, sem a necessidade de extração manual via interface.
Todas as rotas de relatórios retornam dados no formato JSON por padrão, mas
podem ser exportadas como arquivos XLSX ao incluir o parâmetro `download=true`
na query.

> ## 📘
>
> Autenticação da API
>
> Para acessar as rotas, o usuário deve estar autenticado. Consulte a
> [documentação de autenticação](/reference/autenticacao) para mais detalhes.

  

> ## ⚠️
>
> Disponibilidade limitada de alguns relatórios
>
> A exportação de determinados relatórios pode estar restrita com base no tipo
> de conta associada à autenticação. Nem todos os usuários terão acesso a
> todos os relatórios disponíveis.

#

Relatórios

##

Anunciantes

Este endpoint permite buscar informações de todos os anunciantes associados a
uma conta publisher. Os dados são retornados no formato JSON por padrão, mas
podem ser exportados em XLSX ao adicionar o parâmetro `download=true` na query
string.

**🔹 Importante: Apenas disponível na visão do publisher.**

###

Requisição

    
    
    GET https://api-retail-media.newtail.com.br/report/v2/advertisers?start_date=2025-01-01&end_date=2025-01-01 HTTP/1.1
    accept: application/json
    content-type: application/json
    x-app-id: <PUBLISHER_APP_ID>
    x-api-key: <API_KEY>
    

###

Parâmetros da Query

Parâmetro| Obrigatório| Descrição  
---|---|---  
start_date| Sim| Data de início das métricas no formato `YYYY-MM-DD`.  
end_date| Sim| Data de fim das métricas no formato `YYYY-MM-DD`.  
account_info| Não| Se true, inclui informações detalhadas da conta no
resultado. O padrão é `false`.  
page| Não| Número da página dos resultados. O padrão é `1`.  
quantity| Não| Quantidade de itens por página. O padrão é `100`.  
count| Não| Se `true`, retorna o total de registros disponíveis. O padrão é
`false`.  
download| Não| Se `true`, retorna um buffer de arquivo XLSX pronto para
download em vez de JSON.  
  
  

##

Publishers

Este endpoint permite buscar informações sobre o publisher. Os dados são
retornados no formato JSON por padrão, mas podem ser exportados como XLSX ao
incluir o parâmetro download=true na query string.

**🔹 Importante: Apenas disponível na visão do anunciante.**

###

Requisição

    
    
    GET https://api-retail-media.newtail.com.br/report/v2/publishers?start_date=2025-01-01&end_date=2025-01-01 HTTP/1.1
    accept: application/json
    content-type: application/json
    x-app-id: <PUBLISHER_APP_ID>
    x-api-key: <API_KEY>
    

###

Parâmetros da Query

Parâmetro| Obrigatório| Descrição  
---|---|---  
start_date| Sim| Data de início das métricas no formato `YYYY-MM-DD`.  
end_date| Sim| Data de fim das métricas no formato `YYYY-MM-DD`.  
publisher_name| Não| Filtra os resultados pelo nome do publisher.  
account_info| Não| Se true, inclui informações detalhadas da conta no
resultado. O padrão é `false`.  
page| Não| Número da página dos resultados. O padrão é `1`.  
quantity| Não| Quantidade de itens por página. O padrão é `100`.  
count| Não| Se `true`, retorna o total de registros disponíveis. O padrão é
`false`.  
order_by| Não| Define o campo para ordenação dos resultados. Valores
possíveis: `name, balance, total_daily_budget, total_campaigns, impressions,
clicks, ctr, total_spent, conversions, conversion_rate, income, roas.`  
order_direction| Não| Define a direção da ordenação. Valores possíveis: `asc`
(crescente) ou `desc` (decrescente).  
download| Não| Se `true`, retorna um buffer de arquivo XLSX pronto para
download em vez de JSON.  
  
  

##

Publishers da Rede

Este endpoint permite buscar informações sobre os publishers associados a uma
conta Publisher do tipo **Rede**. Os dados são retornados no formato JSON por
padrão, mas podem ser exportados como XLSX ao incluir o parâmetro
download=true na query string.

**🔹 Importante: Apenas publishers que operam no formato Rede têm permissão
para acessar este relatório.**

###

Requisição

    
    
    GET https://api-retail-media.newtail.com.br/report/network/publishers?start_date=2025-01-01&end_date=2025-01-01 HTTP/1.1
    accept: application/json
    content-type: application/json
    x-app-id: <PUBLISHER_APP_ID>
    x-api-key: <API_KEY>
    

###

Parâmetros da Query

Parâmetro| Obrigatório| Descrição  
---|---|---  
start_date| Sim| Data de início das métricas no formato `YYYY-MM-DD`.  
end_date| Sim| Data de fim das métricas no formato `YYYY-MM-DD`.  
publisher_name| Não| Filtra os resultados pelo nome do publisher.  
account_info| Não| Se true, inclui informações detalhadas da conta no
resultado. O padrão é `false`.  
page| Não| Número da página dos resultados. O padrão é `1`.  
quantity| Não| Quantidade de itens por página. O padrão é `100`.  
count| Não| Se `true`, retorna o total de registros disponíveis. O padrão é
`false`.  
order_by| Não| Define o campo para ordenação dos resultados. Valores
possíveis: `name, impressions, clicks, ctr, conversions, conversion_rate,
income, roas, requests`  
order_direction| Não| Define a direção da ordenação. Valores possíveis: `asc`
(crescente) ou `desc` (decrescente).  
download| Não| Se `true`, retorna um buffer de arquivo XLSX pronto para
download em vez de JSON.  
  
  

##

Campanhas

Este endpoint permite buscar todas as campanhas disponíveis, aplicando filtros
conforme necessário. Os dados são retornados no formato JSON por padrão, mas
podem ser exportados como XLSX ao incluir o parâmetro `download=true` na query
string.

###

Requisição

    
    
    GET https://api-retail-media.newtail.com.br/campaign/v2?start_date=2025-01-01&end_date=2025-01-01 HTTP/1.1
    accept: application/json
    content-type: application/json
    x-app-id: <PUBLISHER_APP_ID>
    x-api-key: <API_KEY>
    

###

Parâmetros da Query

Parâmetro| Obrigatório| Descrição  
---|---|---  
start_date| Sim| Data de início das métricas no formato `YYYY-MM-DD`.  
end_date| Sim| Data de fim das métricas no formato `YYYY-MM-DD`.  
status| Não| Filtra pelo status da campanha  
advertiser_id| Não| Filtra campanhas por ID do anunciante.  
ad_type| Não| Filtra pelo tipo de anúncio.  
name| Não| Busca campanhas pelo nome  
account_info| Não| Se true, inclui informações detalhadas da conta no
resultado. O padrão é `false`.  
page| Não| Número da página dos resultados. O padrão é `1`.  
quantity| Não| Quantidade de itens por página. O padrão é `100`.  
count| Não| Se `true`, retorna o total de registros disponíveis. O padrão é
`false`.  
order_by| Não| Define o campo para ordenação dos resultados. Valores
possíveis: `name, impressions, clicks, ctr, conversions, conversion_rate,
income, roas, created_at, start_at, daily_budget, ad_type, advertiser_name,
status`  
order_direction| Não| Define a direção da ordenação. Valores possíveis: `asc`
(crescente) ou `desc` (decrescente).  
download| Não| Se `true`, retorna um buffer de arquivo XLSX pronto para
download em vez de JSON.  
  
  

##

Anúncios

Este endpoint permite buscar todos os anúncios disponíveis, aplicando filtros
conforme necessário. Os dados são retornados no formato JSON por padrão, mas
podem ser exportados como XLSX ao incluir o parâmetro `download=true` na query
string.

###

Requisição

    
    
    GET https://api-retail-media.newtail.com.br/ad/results/v2?start_date=2025-01-01&end_date=2025-01-01 HTTP/1.1
    accept: application/json
    content-type: application/json
    x-app-id: <PUBLISHER_APP_ID>
    x-api-key: <API_KEY>
    

###

Parâmetros da Query

Parâmetro| Obrigatório| Descrição  
---|---|---  
start_date| Sim| Data de início das métricas no formato `YYYY-MM-DD`.  
end_date| Sim| Data de fim das métricas no formato `YYYY-MM-DD`.  
campaign_name| Não| Filtra os anúncios pelo nome da campanha  
campaign_id| Não| Filtra os anúncios pelo ID da campanha  
advertiser_id| Não| Filtra os anúncios pelo ID do anunciante  
product_sku| Não| Filtra os anúncios por um SKU de produto  
ad_status| Não| Filtra anúncios pelo status.  
ad_type| Não| Filtra pelo tipo de anúncio.  
targeting_type| Não| Filtra pelo tipo de segmentação.  
show_inactive| Não| Se `true`, inclui os anúncios que estão pausados.  
account_info| Não| Se `true`, inclui informações detalhadas da conta no
resultado. O padrão é `false`.  
page| Não| Número da página dos resultados. O padrão é `1`.  
quantity| Não| Quantidade de itens por página. O padrão é `100`.  
count| Não| Se `true`, retorna o total de registros disponíveis. O padrão é
`false`.  
order_by| Não| Define o campo para ordenação dos resultados. Valores
possíveis: `ad_type, ad_status, impressions, conversion_rate, ctr, income,
total_spent, roas, conversions,total_conversions_item_quantity.`  
order_direction| Não| Define a direção da ordenação. Valores possíveis: `asc`
(crescente) ou `desc` (decrescente).  
download| Não| Se `true`, retorna um buffer de arquivo XLSX pronto para
download em vez de JSON.  
  
  * __Table of Contents
  *     * Relatórios
      * Anunciantes
      * Publishers
      * Publishers da Rede
      * Campanhas
      * Anúncios

