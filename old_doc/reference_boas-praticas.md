

# Boas práticas

Para garantir sucesso na integração com a Retail Media API, sugerimos as
seguintes práticas:

#

Persistência HTTP

Para toda a integração server side, sugerimos a adoção de conexão HTTP
persistente, para redução do overhead em cada chamada da API.

A ideia é garantir que múltiplas requisições reutilizem a mesma conexão, e
assim não tenhamos o custo de abrir e fechar novas conexões, garantindo que em
um pico de acesso não tenhamos degradação dos recursos de rede de ambos os
lados.

Abaixo um gráfico que explica a diferença de múltiplas conexões e conexão
persistente:

![](https://files.readme.io/b036a19-image.png)

A implementação é simples, somente é necessário que o cliente HTTP usado pra
conexão com a API tenha suporte a adição de um header adicional na requisição:

> Connection: keep-alive

A adição desse header garante que as requisições saindo da mesma origem terão
sempre a mesma conexão.

> ## 📘
>
> Referências
>
> <https://developer.mozilla.org/pt-
> BR/docs/Web/HTTP/Connection_management_in_HTTP_1.x>
>
> <https://en.wikipedia.org/wiki/HTTP_persistent_connection>

#

Implementação de Timeout

Mesmo nossa API tendo altíssima disponibilidade e altamente escalável, não
conseguimos garantir que estaremos no ar 100% do tempo. E mesmo estando
disponível, podemos sofrer com aumento no tempo de resposta na API, e isso
pode impactar negativamente a experiência do usuário no momento da exibição do
anúncio.

A fim de garantir a melhor experiência possível, sugerimos a implementação de
timeout no range de 500-600ms em todas as requisições, principalmente as
requisições de anúncios.

  * __Table of Contents
  *     * Persistência HTTP
    * Implementação de Timeout

