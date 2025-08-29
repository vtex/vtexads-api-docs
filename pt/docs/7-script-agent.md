# 7. VTEX Ads - Script Agent

## 7.1. Objetivo

Este documento detalha o procedimento para a instalação do script de rastreamento da **VTEX Ads** em todas as páginas de um site (exceto as páginas de checkout) através do Google Tag Manager (GTM). A correta implementação deste script é fundamental para a coleta de dados de navegação que permitem a otimização e o direcionamento de campanhas de Retail Media.

## 7.2. Dados Coletados

O script da VTEX Ads foi desenvolvido para coletar exclusivamente dados de navegação não sensíveis, com o objetivo de personalizar a experiência do usuário e otimizar campanhas.

**Dados Coletados:**

-   **Para campanhas off-site:**

    -   `session_id`: Identificador anônimo da sessão de navegação.

    -   `ad_id`: Identificador do anúncio que originou o tráfego.

-   **Para segmentação de audiência (Page View):**

    -   `session_id`: Identificador anônimo da sessão de navegação.

    -   **Informações da Página:** URL, título (`<title>`), e descrição (`<meta name="description">`).


> **Importante:** O script **não coleta** nenhuma informação pessoalmente identificável (PII), como nome, e-mail, CPF, telefone, endereço ou dados de pagamento. A coleta de dados está em conformidade com as principais leis de proteção de dados.

## 7.3. Dados do Script

O script deve ser carregado de forma assíncrona para não impactar o tempo de carregamento da página.

-   **URL do Script:** `https://cdn.newtail.com.br/retail-media/scripts/vtexrma-agent.1.0.0.js`


## 7.4. Passo a Passo para Implementação via Google Tag Manager (GTM)

Para garantir que o script seja executado o mais cedo possível no carregamento da página, recomendamos o uso do acionador de **Inicialização (Initialization)**.

### Passo 7.4.1: Criar a Tag de HTML Personalizado

1.  Acesse seu contêiner do GTM e vá para a seção **"Tags"**.

2.  Clique em **"Nova"** para criar uma nova tag.

3.  Dê um nome claro para a tag, por exemplo: **"Custom HTML - VTEX Ads Agent"**.

4.  Clique em **"Configuração da tag"** e selecione o tipo de tag **"HTML personalizado"**.

5.  No campo de HTML, insira o seguinte código:

    ```
    <script type="text/javascript" async src="https://cdn.newtail.com.br/retail-media/scripts/vtexrma-agent.1.0.0.js"></script>
    ```


### Passo 7.4.2: Configurar o Acionador Principal

1.  Abaixo da configuração da tag, clique em **"Acionamento"**.

2.  Selecione o acionador **"Initialization - All Pages"** (Inicialização - Todas as Páginas). Este acionador garante que o script seja disparado antes da maioria das outras tags, em todas as páginas.


### Passo 7.4.3: Criar e Adicionar uma Exceção de Acionamento

Para evitar que o script seja executado nas páginas de checkout, criaremos uma exceção.

1.  Ainda na configuração da tag, na seção **"Acionamento"**, clique em **"Adicionar exceção"**.

2.  Clique no ícone de **"+"** no canto superior direito para criar um novo acionador de exceção.

3.  Dê um nome para o acionador, por exemplo: **"Trigger Exception - Checkout Pages"**.

4.  Clique em **"Configuração do acionador"** e escolha o tipo **"Inicialização"**.

5.  Em **"Este acionador é disparado em"**, selecione **"Algumas inicializações"**.

6.  Configure a condição para identificar as páginas de checkout. A condição pode variar dependendo da estrutura da URL do seu site. Exemplos comuns:

    -   `Page Path` | `contém` | `/checkout`

    -   `Page URL` | `corresponde ao RegEx (sem distinção entre maiúsculas e minúsculas)` | `/checkout/|/orderPlaced/`

7.  Salve o novo acionador de exceção. Ele será automaticamente adicionado à sua tag.


### Passo 7.4.4: Salvar e Publicar

1.  Salve a tag recém-criada.

2.  Envie e publique as alterações no seu contêiner do GTM.


## 7.5. Configuração da Sessão do Usuário

Para que a plataforma VTEX Ads possa correlacionar corretamente as interações do usuário, é necessário informar qual é o identificador de sessão utilizado pelo seu e-commerce.

**Ação Necessária:**

A equipe responsável pelo e-commerce deve informar à equipe da VTEX Ads qual é o **nome do atributo no `cookie` ou `sessionStorage`** que armazena o ID da sessão do usuário.

-   **Exemplo:** Se o ID da sessão estiver armazenado em um cookie chamado `vtex_session`, essa informação deve ser repassada.


Esta configuração permite que o script leia o identificador correto e o associe aos eventos de navegação.