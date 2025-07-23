# 4. Segurança de Dados

A segurança dos dados é um pilar fundamental da nossa plataforma. Desde o início, nossa arquitetura foi projetada para garantir que nenhuma informação sensível seja coletada e que os dados dos usuários permaneçam sempre protegidos e não identificáveis.

## Dados Não Identificáveis

Não coletamos dados sensíveis dos usuários, como nome, e-mail ou documentos. As informações que recebemos, como e-mails ou CPFs (PII - *Personally Identifiable Information*), já chegam em nossa plataforma com um hash criptográfico irreversível.

Isso significa que o dado original nunca trafega ou é armazenado em nossos sistemas. O resultado é um identificador anônimo que nos permite agrupar comportamentos e audiências sem nunca saber quem é o usuário real.

**Por que isso é seguro?**

*   **Irreversibilidade:** O processo de hashing é uma via de mão única. Mesmo que alguém tivesse acesso ao hash, não conseguiria descobrir o dado original.
*   **Anonimato:** Como não armazenamos o dado original, não temos como identificar o usuário. Para todos os efeitos, os dados são anônimos.

## Criptografia em Trânsito e em Repouso

Todos os dados, sejam eles identificadores anônimos ou informações sobre campanhas e anúncios, são tratados com os mais altos padrões de segurança:

*   **Criptografia em Trânsito:** Toda a comunicação entre nossos sistemas e com parceiros é feita utilizando protocolos seguros como TLS 1.2+, garantindo que os dados não possam ser interceptados durante a transferência.
*   **Criptografia em Repouso:** Os dados armazenados em nossos bancos de dados e sistemas de arquivos são criptografados. Utilizamos soluções robustas e reconhecidas no mercado, como **Amazon RDS**, **Amazon S3**, **Amazon Redshift** e **Snowflake**, que aplicam criptografia AES-256, um dos algoritmos mais seguros existentes.

## Acesso Restrito

O acesso aos dados é rigorosamente controlado e limitado a um grupo seleto de engenheiros e analistas sêniores. Cada acesso é auditado e monitorado, e as permissões são concedidas com base no princípio do menor privilégio, ou seja, cada pessoa tem acesso apenas ao que é estritamente necessário para realizar seu trabalho.

Essa combinação de dados não identificáveis, criptografia de ponta a ponta e controle de acesso rigoroso garante que a sua informação e a de seus clientes estejam sempre seguras.
