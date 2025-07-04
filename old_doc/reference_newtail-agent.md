

# Newtail Agent

A ideia do Newtail agent é simplificar a integração para alguns cenários
específicos e não deve ser utilizado como primeira alternativa.

A configuração é feita em duas etapas.

#

1\. Inclusão do script do agent

JavaScript

    
    
    <script src="https://cdn.newtail.com.br/retail-media/scripts/agent.1.0.0.js"></script>
    

#

2\. Adição da tag HTML que irá conter o anúncio

HTML

    
    
    <newtailad width="" height="" data-placement-name="" data-session-id="" data-user-id="" data-xxx></newtailad>
    

> ## 📘
>
> Cada página poderá ter qualquer quantidade de placements, desde que cada
> placement seja único

##

Atributos da tag HTML

atributo| descrição| Obrigatório?| exemplo  
---|---|---|---  
width| indica a largura máxima do anúncio| sim| 720px  
height| indica a altura máxima do anúncio| sim| 300px  
data-placement-name| indica qual é o nome do placement| sim|
home_bottom_betano  
data-session-id| indica qual é o id de sessão do usuário| sim|  
data-user-id| indica qual é o id único do usuário| Somente quando o usuário
está logado|  
data-campaign-type| indica se é uma campanha é endêmica ou não endêmica.  
  
Obs.:  
  
Endêmica: nunca tira o usuário de dentro do site  
Não Endêmica: pode tirar o usuário de dentro do site  
  
Opções:  
  
\- endemic (default)  
\- non_endemic| sim|  
  
  

#

Campanhas não endêmicas com script de terceiros

Em alguns casos, alguns parceiros exigem a adição de scripts nas páginas para
poder executar seus anúncios (ex.: Betano), porem como sempre existe uma
preocupação do publisher com a segurança do seu site em relação a terceiros.

A Newtail implementa uma camada de proteção que evita que qualquer anunciante
que necessite desse tipo de permissão nunca tenha acesso ao conteúdo do site.
Dessa forma, permitir anúncios desse tipo, passa a ser possível e seguro.

  * __Table of Contents
  *     * 1\. Inclusão do script do agent
    * 2\. Adição da tag HTML que irá conter o anúncio
      * Atributos da tag HTML
    * Campanhas não endêmicas com script de terceiros

