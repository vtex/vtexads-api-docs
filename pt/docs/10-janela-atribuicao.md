# Janela de Atribuição e Modelos de Conversão

Este documento detalha as regras, modelos e prazos que regem a atribuição de conversões (vendas) e a cobrança das campanhas de publicidade em nossa plataforma.

## 1. O que é a Janela de Atribuição?

A "janela de atribuição" (ou janela de conversão) é o período de tempo _após_ um usuário interagir com um anúncio (seja clicando ou visualizando) durante o qual uma conversão pode ser creditada a esse anúncio.

- **Janela Padrão:** 14 dias.
- **Flexibilidade:** Este período é o padrão para todas as campanhas, mas pode ser customizado conforme a necessidade estratégica.

**Exemplo:** Se um usuário clica em um anúncio hoje, qualquer compra que ele fizer do produto associado nos próximos 14 dias poderá ser atribuída a esse anúncio.

## 2. Medição (Atribuição) vs. Cobrança (Faturamento)

É fundamental diferenciar o evento que _mede_ a atribuição (o que usamos para contar uma conversão) do evento que _gera a cobrança_ (o que cobramos do anunciante).

### 2.1. Eventos de Medição (Atribuição)

Isto define _como_ sabemos que um anúncio "funcionou" para gerar uma venda:

- **Campanhas de Produto (Product Ads):**
  - **Evento:** Clique.
  - **Lógica:** A conversão só é contada se o usuário _clicou_ no anúncio antes de comprar.

- **Demais Campanhas (Banner, Vídeo e Sponsored Brands):**
  - **Evento:** Visualização (Impressão).
  - **Lógica:** A conversão pode ser contada mesmo que o usuário apenas _tenha visto_ o anúncio (e não necessariamente clicado), seguindo as regras de hierarquia (ver seção 3).

### 2.2. Modelos de Cobrança (Faturamento)

Isto define _pelo quê_ o anunciante paga:

- **CPC (Custo por Clique):** O anunciante paga cada vez que um usuário clica no anúncio.
  - _Usado em:_ Campanhas de Produto, Sponsored Brands.

- **CPM (Custo por Mil Impressões):** O anunciante paga um valor fixo por cada 1.000 vezes que o anúncio é exibido.
  - _Usado em:_ Banner, Vídeo, Sponsored Brands.

- **Modelo Híbrido (CPC + CPM):**
  - As campanhas de **Sponsored Brands** são únicas, pois cobram _tanto_ pelos cliques (CPC) quanto pelas impressões (CPM) geradas.

#### Exemplo de Cálculo de Cobrança (CPM)

O CPM define o valor para 1.000 impressões, mas a cobrança real é proporcional a cada impressão individual.

- **Cenário:** Uma campanha de vídeo possui um CPM de **R$ 10,00**.
- **Resultado:** A campanha gera **10 impressões**.

**Cálculo:**

1. **Custo por impressão individual:** R$ 10,00 (CPM) / 1.000 (impressões) = **R$ 0,01 por impressão**.
2. **Custo Total:** 10 (impressões geradas) * R$ 0,01 (custo por impressão) = **R$ 0,10**.

O custo total dessa campanha seria de **dez centavos**.

## 3. Regras de Atribuição (A Hierarquia de Decisão)

Quando um usuário interage com múltiplos anúncios antes de comprar, um modelo de atribuição decide qual campanha receberá o crédito pela venda.

**Princípio Fundamental:** A atribuição é exclusiva. Um pedido vendido **nunca** é atribuído a duas campanhas distintas; o crédito é sempre dado a uma única campanha.

A decisão segue esta ordem de prioridade:

1. **Prioridade 1: Campanhas Offsite**
   - Se existe uma campanha _offsite_ ativa (trazendo tráfego externo para o site) e ela foi o último ponto de contato do usuário, ela terá preferência total na atribuição da venda.

2. **Prioridade 2: Último Clique (Last Click)**
   - Na ausência de um clique offsite recente, o sistema procura o _último anúncio_ (dentro da plataforma) que o usuário _clicou_ dentro da janela de 14 dias.

3. **Prioridade 3: Última Visualização (Last View)**
   - Se o usuário não clicou em nenhum anúncio no período, o sistema atribui a venda ao _último anúncio_ que ele _visualizou_ (desde que seja um tipo de campanha que meça por visualização, como Banner ou Vídeo).

**Regra de Tempo:** Para que uma conversão seja válida, o evento de interação (clique ou visualização) deve, obrigatoriamente, ter ocorrido _antes_ do pedido ser finalizado.

## 4. Mapeamento de Produtos na Atribuição

Uma campanha só pode receber atribuição por produtos que estão _explicitamente atrelados a ela_.

### 4.1. Campanhas de Produto (Atribuição 1:1)

- **Como funciona:** Cada anúncio (AD) dentro da campanha representa um produto específico.
- **Lógica:** A atribuição é direta e 1 para 1. O clique no anúncio do "Produto A" só pode gerar conversão para o "Produto A".

### 4.2. Demais Campanhas (Banner, Vídeo, etc.) (Atribuição N:1)

- **Como funciona:** Estas campanhas possuem uma _lista_ de produtos associados (SKUs).
- **Lógica:** A interação (clique ou view) com um único criativo (banner ou vídeo) pode gerar atribuição para _qualquer_ um dos produtos contidos nessa lista da campanha.

**Observação sobre Criativos:** Dentro de uma campanha (ex: Banner), cada criativo (ex: o "Banner A" e o "Banner B") metrifica suas informações de forma independente. Isso permite analisar a performance individual de cada peça de anúncio.

## 5. Latência de Dados (Atraso na Atribuição)

É importante notar que existe um atraso natural entre o momento em que o cliente cria o pedido e o momento em que essa venda é associada (atribuída) à campanha correta nos relatórios.

- **Integração via API:** Atraso de aproximadamente **30 minutos**.
- **Plataforma VTEX:** Atraso de até **2 horas**.
