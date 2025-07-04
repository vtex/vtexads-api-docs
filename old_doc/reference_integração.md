

# Integração de Audiências

#

Conexão de Integração

> ## 📘
>
> A conexão de integração ocorrerá através de:
>
>   * Envio periódico das audiências acordado entre as partes
>   * Envio para o nosso S3 (deverá ser solicitado as credências de acesso
> para o seu contato na Newtail)
>   * O arquivo deverá ser enviado em formato de `Parquet` com compressão
> `Snappy`
>   * A Newtail irá disponibilizar as credenciais do S3
>

> ## 🚧
>
> Recomendação para o envio
>
> Na integração inicial, é fundamental que todos os dados sejam enviados. E
> esses dados podem ser enviados em múltiplos arquivos. (dependendo do tamanho
> da base. Um bom número é 1 milhão de linhas por arquivo)
>
> Após a primeira integração, o ideal é que seja enviado, somente o delta dos,
> das linhas que tiveram alguma modificação

Os arquivos devem ser escritos do seguinte padrão de diretório:

    
    
    PREFIXO/audiences/YYYY/mm/dd/TIMESTAMP.parquet.snappy
    

Atributo| Descrição| Exemplo  
---|---|---  
PREFIXO| O prefixo será informado pela Newtail| xyz  
YYYY| Ano da geração com 4 dígitos| 2023  
mm| Mês da geração com dois dígitos (Janeiro = 01 e dezembro =12)| 09  
dd| Dia da geração com dois dígitos (de 01 até 31)| 31  
TIMESTAMP| Timestamp é a quantidade de segundos desde 1970  
(nome do arquivo pode ser qualquer coisa, o timestamp é apenas uma sugestão
que nunca irá se repetir)| 1694812122  
  
##

Arquivo de audiências

###

Atributos

A grande maioria dos atributos não são obrigatórias, no entanto, quanto maior
for o preenchimento de todas essas informações, a relevância será melhor.

> ## 📘
>
> As colunas são case sensitive
>
> Mantenha o nome das colunas, da forma como elas estão sendo apresentadas.

Coluna| Tipo| Obrigatório?| Descrição  
---|---|---|---  
CUSTOMER_ID| String| Sim| Identificador único do cliente  
EMAIL_HASHED| String| Não| PII baseado no e-mail do cliente  
PHONE_HASHED| String| Não| PII baseado no telefone principal do cliente  
SOCIAL_ID_HASHED| String| Não| PII baseado no CPF do cliente  
FIRST_NAME_HASHED| String| Não| PII baseado no Primeiro Nome do cliente  
LAST_NAME_HASHED| String| Não| PII baseado no Último nome do cliente  
GENDER| String| Não| Indica qual o sexo do cliente.  
  
\- F: para feminino  
\- M: para masculino  
\- O: para outros  
\- NULL: para não identificados  
AGE| Int| Não| Indica a idade do cliente  
CEP| String| Não| Indica qual o CEP do endereço do cliente  
COUNTRY| String| Não| Indica qual o país do usuário  
STATE| String| Não| Indica o estado onde reside o cliente  
CITY| String| Não| Indica a cidade onde reside o cliente  
NEIGHBORHOOD| String| Não| Indica o bairro onde reside o cliente  
AUDIENCES| String| Não| Uma lista de audiências. Devem ser separadas por ponto
e vírgula (;)  
NBO_PRODUCTS| String| Não| Uma lista de SKU de produtos. Devem ser separadas
por ponto e vírgula (;)  
NBO_CATEGORIES| String| Não| Uma lista de categorias Devem ser separadas por
ponto e vírgula (;)  
  
Essa lista de categorias pode receber uma árvore de categorias usando o " > "
como separador.  
  
Exemplo:  
  
`Tablets`  
`Bebidas > Bebidas Não Alcoólicas`  
`Livros > Gastronomia > Guias de Bares e Restaurantes`  
  
seria escrito da seguinte forma:  
`Tablets;Bebidas > Bebidas Não Alcoólicas;Livros > Gastronomia > Guias de
Bares e Restaurantes`  
  
Neste exemplo temos três categorias. Mesmo categoria mais de alto nível como
**Tablets** quanto categorias mais especializadas como **Livros > Gastronomia
> Guias de Bares e Restaurantes**.  
  
###

Hash dos campos

Dados confidenciais precisam set criptografados antes de serem enviados usando
usando o algoritmo SHA256.

  * EMAIL_HASHED
  * PHONE_HASHED
  * SOCIAL_ID_HASHED
  * FIRST_NAME_HASHED
  * LAST_NAME_HASHED

> ## 📘
>
> Antes de gerar hash dos dados é necessário remover todos os ESPAÇOS e
> converter para **MINÚSCULO** os seus valores.

> ## 🚧
>
> Para o atributo PHONE_HASHED, será necessário formata-lo no padrão E.164 e
> incluir o código de chamada do país.

####

Formato E.164

  1. Remova todos os caracteres não numéricos, como espaços, traços, parênteses e símbolos.
  2. Adicione o código do país com o sinal de adição (+) no início. O código do país é um código de país de 1 a 3 dígitos que identifica o país do número de telefone. Você pode encontrar uma lista de códigos de país na norma ISO 3166-1.
  3. Adicione o código de área (se aplicável) sem o zero inicial. Por exemplo, nos Estados Unidos, o código de área é composto por três dígitos e não deve começar com zero.
  4. Inclua o número de telefone local sem o zero inicial (caso aplicável).

Exemplo:

  * Um número de telefone dos Estados Unidos, com código de área 212 e número local 555-1234, seria formatado como: +12125551234
  * Um número de telefone do Brasil, com código de área 11 e número local 98765-4321, seria formatado como: +5511987654321

####

Criando um HASH de um atributo após formatado usando PYTHON

Python

    
    
    import re
    import hashlib
    
    hash_obj = hashlib.sha256()
    
    def create_hash(x):
        cleaned = re.sub('\s+', '', x.lower())
        hash_obj.update(cleaned.encode('utf-8'))
        return hash_obj.hexdigest()
    
    create_hash(' Allan ') #=> 8c01ade3cb71d3ac7c718ed5a0c565155a4c05a216d9e59013c5d7b49e916914
    

  * __Table of Contents
  *     * Conexão de Integração
      * Arquivo de audiências

