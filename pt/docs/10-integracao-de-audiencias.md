## Integração de Audiências

Para segmentar campanhas utilizando PII (Informações de Identificação Pessoal), você deve fornecer um arquivo CSV contendo os dados dos usuários.

### Requisitos do Arquivo e dos Dados:

1.  **Formato do Arquivo**: O arquivo deve ser um CSV codificado em UTF-8.
2.  **Envio**: O arquivo CSV deve ser compactado em um arquivo ZIP e enviado por e-mail para o seu contato na Newtail.
3.  **Colunas de Dados**:
    *   `CUSTOMER_ID` (String, **Obrigatório**): Um identificador único para o cliente.
    *   `EMAIL_HASHED` (String, Opcional): E-mail do cliente hasheado.
    *   `PHONE_HASHED` (String, Opcional): Número de telefone principal hasheado.
    *   `SOCIAL_ID_HASHED` (String, Opcional): Número do CPF hasheado.
    *   `FIRST_NAME_HASHED` (String, Opcional): Primeiro nome hasheado.
    *   `LAST_NAME_HASHED` (String, Opcional): Sobrenome hasheado.

### Regras de Hashing:

Todos os campos de dados sensíveis devem ser hasheados utilizando o algoritmo **SHA256**. Antes do hashing, os dados devem ser pré-processados da seguinte forma:

1.  **Normalização**: Converta a string para minúsculas e remova todos os espaços.
2.  **Números de Telefone**: O número de telefone deve ser formatado no padrão **E.164** (ex: `+5511987654321`) *antes* da normalização e do hashing.