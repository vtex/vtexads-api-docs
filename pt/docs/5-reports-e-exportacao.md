## 5. Reports e Exportação de Dados

### 5.1. Exportação via API
Endpoints REST para extrair relatórios consolidados em JSON (ou XLSX com `download=true`).

* `GET /report/v2/advertisers`: Desempenho por anunciante (visão do publisher).
* `GET /report/v2/publishers`: Desempenho por publisher (visão do anunciante).
* `GET /campaign/v2`: Relatório detalhado de campanhas.
* `GET /ad/results/v2`: Relatório de performance de anúncios individuais.

### 5.2. Exportação de Dados Brutos (via Storage)
Configuramos a exportação diária (D-1) de dados para um bucket de sua preferência (AWS S3, Google Cloud Storage, Azure Blob).

* **Eventos (impressões, cliques, conversões):** Arquivos `Parquet` + `Snappy`. É necessário fazer a de-duplicação usando o `event_id`.
* **Dados Agregados (relatórios de campanhas, anunciantes):** Arquivos `CSV`.
