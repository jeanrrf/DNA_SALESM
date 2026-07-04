# DNA SALES MARTINS — Resumo Conciso (Repositórios Selecionados)

Este documento foi atualizado para conter apenas os repositórios centrais que serão mantidos e analisados para o projeto Sales Martins. Repositórios experimentais, forks e protótipos foram removidos desta documentação principal para reduzir ruído. A lista abaixo contém as fontes canônicas que precisamos conservar, endurecer e usar como base para a V2.

---

## Repositórios incluídos (canônicos)

1) salesmartins
- URL: https://github.com/jeanrrf/salesmartins
- Visibilidade: public
- Linguagem primária: Python
- Branch default: master
- Observações: Vitrine histórica e API básica. Contém frontend estático (/frontend) e backend (api.js) com endpoints /api/products e /api/categories e autenticação administrativa. Deve ser mantido como referência para features de vitrine e migrado/armonizado para a arquitetura V2.

2) v2-of-sales-martins
- URL: https://github.com/jeanrrf/v2-of-sales-martins
- Visibilidade: private
- Linguagem primária: TypeScript
- Branch default: main
- Observações: Repositório de projeto e design para a V2. Contém documentação técnica (SHOPEE-INTEGRATION.md, IMPLEMENTACAO-COMPLETA.md). Serve como fonte canônica para design e infra do V2; remover chaves hardcoded e transformar em repositório de infraestrutura/arquitetura.

3) BACKEN_NODEJS_SIAW
- URL: https://github.com/jeanrrf/BACKEN_NODEJS_SIAW
- Visibilidade: private
- Linguagem primária: TypeScript
- Branch default: main
- Observações: Serviço backend contendo Next.js API routes (ex.: pages/api/shopee/generate-link-new.ts) e scripts/SQL do banco (setup_shopee_products.sql). Fonte canônica das integrações Shopee e do schema do banco; deve ser endurecido e transformado em pacote de serviços reutilizável.

4) PRD_SIAW_VERCEL_SHO_MAE
- URL: https://github.com/jeanrrf/PRD_SIAW_VERCEL_SHO_MAE
- Visibilidade: public
- Linguagem primária: JavaScript
- Branch default: main
- Observações: Deploy público (produção/demo). Manter como ambiente de produção/staging; alinhar CI/CD e segredos com o backend canônico.

5) champion_shope
- URL: https://github.com/jeanrrf/champion_shope
- Visibilidade: private
- Linguagem primária: HTML / Python
- Branch default: master
- Observações: Implementação de autenticação Shopee (backend/shopee_affiliate_auth.py) e assets. Extrair módulo de autenticação para o backend canônico (BACKEN_NODEJS_SIAW) ou para um pacote compartilhado.

---

## Observações de Governança
- Arquive repositórios experimentais e forks (lista mantida em inventory.csv histórica). Arquivar preserva histórico e reduz ruído operacional. Repositórios arquivados podem ser restaurados a qualquer momento.
- Antes de qualquer arquivamento definitivo, garanta backups/clone locais. Utilize o script `archive-repos.sh` no repo `DNA_SALESM` para arquivar candidatos com confirmação manual.
- Prioridade imediata: rotacionar qualquer chave exposta, consolidar a integração Shopee em um módulo reutilizável e unificar o cliente Supabase.

---

Documento atualizado: contém apenas os repositórios que definimos como canônicos para análise e desenvolvimento futuro. Para histórico completo e lista completa com decisões, ver `inventory.csv` neste repositório.
