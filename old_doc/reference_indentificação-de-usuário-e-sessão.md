

# Entendendo os Eventos

#

Identificação de Usuário e Sessão

Todas as solicitações de Beacons requerem informações específicas para que
possam ser identificadas e atribuídas aos usuários, juntamente com suas
respectivas conversões. Para esse fim, empregamos dois conceitos principais:

##

session_id

O **session_id** é o identificador da sessão do usuário. Ele possui uma
duração limitada e nos auxilia na identificação de quando um usuário passa de
um estado não identificado para um estado identificado. Além disso, ele nos
ajuda a compreender quantas sessões um usuário realiza até gerar uma
conversão.

O **session_id** é obrigatório em todos os casos, mesmo que se trate de uma
sessão breve. Por exemplo, ao executar uma conversão offline no ponto de venda
(PDV), este pode ser um valor gerado aleatoriamente.

Entretanto, para sessões em websites, esse valor deve ser consistente com o ID
da sessão atual do usuário.

##

user_id

O **user_id** é o identificador único do cliente dentro da plataforma. Este
deve ser o mesmo identificador em todos os canais utilizados pelo usuário.
Isso nos permite entender se um usuário interagiu com um anúncio online e
realizou uma compra em outro canal (por exemplo, offline).

O **user_id** pode acompanhar todos os eventos, porém, é obrigatório apenas na
etapa de conversão, uma vez que esse é o único momento em que o cliente é
obrigatoriamente identificado.

#

Quando um evento é computado

Eventos de **impressão** , **clique** e **visualização** são deduplicadas para
o mesmo usuário no mesmo dispositivo para o mesmo anúncio.

  * Impressões: um minuto completo;
  * Clique: uma hora completa.

**Já os eventos de conversão são sempre computados, independentemente dessas
condições.**

  * O evento de conversão será deduplicado em um intervalo de 30 dias, então se chegar um novamente um anúncio com o mesmo id de pedido, ele será computado novamente.

##

Exemplo:

###

Caso 1: O cliente mantem a mesma sessão

O cliente 1 clicou no anúncio A às 12h do dia 1 e fez mais três cliques no
mesmo anúncio ao longo do dia. Nesse caso, apenas um clique será computado.

No dia 2, o cliente 1 voltou a clicar no mesmo anúncio antes das 12h (mantendo
a mesma sessão enviado no dia 1). Nesse caso, também não será computado um
novo clique. No entanto, após as 12h, o cliente volta a clicar no mesmo
anúncio, e agora será computado um novo clique.

###

Caso 2: O cliente muda a sessão

Se o cliente mudar a sessão, o evento será sempre computado, independentemente
do tempo decorrido desde a última interação.

É importante ressaltar que, em todos os casos, os eventos de `conversão` são
sempre computados, mesmo que o cliente mantenha a mesma sessão ou altere-o.

##

Janela de Conversão

A **Janela de Conversão** ou **Janela de Atribuição** é a forma atual
utilizada para computar uma conversão para um usuário final.

A ideia consiste em ter uma janela de N dias após um evento para que uma
conversão seja atribuída para um anúncio que um usuário interagiu.

Hoje possuímos dois principais tipos de atribuição para conversão:

**Anúncio de Produto**

O anúncio de produto possui uma janela de conversão de **7 dias** e o evento
que aciona esse comportamento é o **click** do usuário final.

Neste cenário, não importa quantos anúncios de produtos o usuário viu, só será
iniciado o rastreamento das compras do usuário quando ele efetivamente clicar
em um anúncio. A partir deste momento, esse anúncio será monitorado pelos
próximos 7 dias.

**Anúncio de Display/Video**

Este tipo de anúncio possui uma janela de conversão de **14 dias** e o evento
que aciona esse comportamento é o de **visualização** do usuário final (toda
vez que um usuário ver esse tipo de anúncio, já se enquadra na visualização).

Neste cenário, o que importa é que o anúncio tenha sido exibido na tela para o
usuário, a partir desse momento o rastreamento já é iniciado e dura **14
dias**. Então se um cliente voltar a comprar algum daqueles produtos que estão
atrelados ao anúncio nesse período, então a conversão será atribuída.

##

Deduplicação de Eventos

**Click** possuem uma deduplicação de 1h. caso um usuário final clique no
mesmo anúncio mais de uma vez no intervalo de 1h, será computado apenas a
primeira vez que o usuário clicou. Caso ele volte a clicar após 1h, será
computado novamente.

**Impressão** possuem uma deduplicação de 1min. caso um usuário final seja
impactado por um mesmo anúncio mais de uma vez no intervalo de 1min, será
computado apenas a primeira vez. Caso ele volte a ser impactado após 1min,
será computado novamente a impressão.

  * __Table of Contents
  *     * Identificação de Usuário e Sessão
      * session_id
      * user_id
    * Quando um evento é computado
      * Exemplo:
      * Janela de Conversão
      * Deduplicação de Eventos

