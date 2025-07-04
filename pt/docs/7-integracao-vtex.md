### 6.2. Integração com VTEX (VTEX IO App)
Para lojas na plataforma VTEX, a Newtail oferece um aplicativo de storefront (`Newtail Media APP VTEX`) que simplifica drasticamente a implementação. O app já inclui componentes visuais e toda a lógica para consulta de anúncios e notificação de eventos.

*   **Passo 1: Sincronização do Catálogo**
    *   A sincronização do catálogo de produtos é um pré-requisito. Ela pode ser feita de duas formas:
        1.  **Via API:** Fornecendo à Newtail as chaves de API para leitura do seu catálogo.
        2.  **Via XML:** Fornecendo um link para um feed XML no formato do Google Shopping, que deve conter o campo `SKU` para identificação do produto.

*   **Passo 2: Instalação do App**
    1.  **Adicionar como Dependência:** No arquivo `manifest.json` do seu tema, adicione `"newtail.media": "0.x"` ao `peerDependencies`.
    2.  **Instalar o App:** Execute o comando `vtex install newtail.media@0.x` no seu terminal.

*   **Passo 3: Configuração**
    1.  **ID do Publisher:** No admin da sua loja VTEX, acesse `Configurações da Loja > Newtail Media` e insira o seu `Publisher ID` fornecido pela Newtail.
    2.  **Política de Conteúdo (CSP):** Adicione as seguintes diretivas ao seu `policies.json`:
        ```json
        {
          "contentSecurityPolicy": {
            "default-src": ["'self'", "newtail-media.newtail.com.br"],
            "connect-src": ["'self'", "newtail-media.newtail.com.br"]
          }
        }
        ```

*   **Passo 4: Uso dos Blocos**
    *   Declare os blocos do app nos templates do seu tema para exibir os anúncios.

    *   **Componentes Disponíveis:**
        *   `newtail-media-banner`: Renderiza banners patrocinados.
        *   `newtail-media-shelf`: Renderiza uma prateleira de produtos patrocinados.
        *   `newtail-media-search`: Adiciona selos "Patrocinado" aos produtos nos resultados de busca.
        *   `newtail-media-conversion`: Componente essencial que gerencia o envio de eventos de conversão. **Deve ser incluído em todas as páginas.**