

# Segmentação de Campanhas por PII

A segmentação por PII deve ocorrer por CSV e permitirá a criação de campanhas
com usuários conhecidos pelo anunciante.

##

Arquivo de audiências

O Arquivo de integração será um arquivo de **CSV** em **UTF-8**.

###

Atributos

A grande maioria dos atributos não são obrigatórias, no entanto, quanto maior
for o preenchimento de todas essas informações, a relevância será melhor.

Coluna| Tipo| Obrigatório?| Descrição  
---|---|---|---  
CUSTOMER_ID| String| Sim| Identificador único do cliente  
EMAIL_HASHED| String| Não| PII baseado no e-mail do cliente  
PHONE_HASHED| String| Não| PII baseado no telefone principal do cliente  
SOCIAL_ID_HASHED| String| Não| PII baseado no CPF do cliente  
FIRST_NAME_HASHED| String| Não| PII baseado no Primeiro Nome do cliente  
LAST_NAME_HASHED| String| Não| PII baseado no Último nome do cliente  
  
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
    

###

Envio do Arquivo

O arquivo deve ser enviado em ZIP por E-mail para o seu contato na Newtail

  *  __Table of Contents
  *     * Arquivo de audiências
      * Atributos
      * Hash dos campos
      * Envio do Arquivo

