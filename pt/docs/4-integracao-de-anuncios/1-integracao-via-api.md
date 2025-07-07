## 4. Integração Principal

A integração é fundamentada em três pilares que garantem o funcionamento da solução.

### Pilares da Integração

1.  **[Catálogo](./4.1-sincronizacao-de-catalogo.md):** Manter a VTEX Ads sincronizada com seu catálogo de produtos e inventário (preço e estoque). Essencial para anúncios de produto.
2.  **[Consulta de Anúncios](./4.2-consulta-de-anuncios.md):** Sua plataforma requisita à API os anúncios que devem ser exibidos em diferentes páginas e contextos.
3.  **[Eventos](./4.3-eventos.md):** Sua plataforma notifica a API sobre todas as interações do usuário com os anúncios e, crucialmente, sobre as conversões (vendas).

### Tipos de Anúncios

| Tipo de Anúncio | API Type | Descrição                                       |
| :--- | :--- |:------------------------------------------------|
| **Sponsored Products** | `product` | Anúncios de produtos individuais.               |
| **Display** | `banner` | Anúncios visuais (imagem estática ou vídeo).    |
| **Sponsored Brands** | `sponsored_brand` | Anúncios de marca com título, logo e produtos. (imagem estática ou vídeo) |
| **Digital Signage** | `digital_signage`| Conteúdo para telas e totens físicos.           |

### Segmentação de Anúncios

Direcione anúncios para públicos específicos para aumentar a relevância. Veja mais em [Segmentação de Anúncios](./4.4-segmentacao-de-anuncios.md).


