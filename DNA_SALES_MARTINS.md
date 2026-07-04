# DNA SALES MARTINS

Entregando o relatório consolidado “DNA SALES MARTINS” com base na varredura e leitura de todos os repositórios e arquivos relacionados a Sales Martins / Shopee / SIAW que estão acessíveis no seu perfil. Trabalhei somente em leitura — nenhuma alteração foi feita. Observe: a busca de código pode estar paginada pelo GitHub; alguns resultados podem não aparecer na primeira página de search. Link usado como referência: https://github.com/jeanrrf?tab=repositories

---

## Resumo executivo

A plataforma “Sales Martins” é um conjunto de projetos (vários repositórios) que implementam uma solução de afiliados Shopee + catálogo de produtos + painel administrativo + pipelines de ingestão e automação, com Supabase/Postgres como backend principal e integrações com Shopee (GraphQL), Vercel (deploy), e provedores de IA (AINEX / NVIDIA). Há implementações em Node/Next, TypeScript/React, e Python. Detectei produção/demos públicas (ex.: PRD_SIAW_VERCEL_SHO_MAE) e diversas variantes privadas (v2-of-sales-martins, siawshope, BACKEN_NODEJS_SIAW, SIAW_MARTINS_*). Principais riscos: segredos hardcoded (ex.: Supabase key em código), branches experimentais e duplicação de frontends/repos que favorecem divergência técnica. Recomendo mitigação imediata de segredos, consolidação de infra e criação de pipelines CI.

---

## Escopo & metodologia

- Escopo: todos os repositórios no seu perfil com relação ao termo “Sales Martins” e termos relacionados (Shopee, supabase, catalog, affiliate, automation, siaw, ainex, csv).
- Fontes: repositórios (READMEs, arquivos-chave: package.json, pages/api, scripts, SQL, docs/), code search em repositórios do usuário, arquivos encontrados em múltiplos repositórios Sentinnell/AINEX que referenciam PRD_SIAW_SalesMartins.
- Restrições: somente leitura; não executei nenhum script; não coletei nem revelei valores reais de segredos/keys.

---

## Inventário focal (repositórios relacionados a Sales Martins / Shopee / automação)

- **salesmartins** — https://github.com/jeanrrf/salesmartins
  - Visibilidade: public
  - Linguagem primária: Python
  - Branch default: master (outros branches: main, OFIIAL, SALESOFICIAL, SENTINNELL_VERCEL, recuperacao-projeto, dependabot/*)
  - Criado: 01 Apr 2025 — Última atualização: 22 Mar 2026
  - Observações: contém frontend estático (/frontend) e backend (api.js) com rotas /api/products, /api/categories, autenticação JWT (admin).

- **v2-of-sales-martins** — https://github.com/jeanrrf/v2-of-sales-martins
  - Visibilidade: private
  - Linguagem: TypeScript
  - Branch default: main
  - Criado/Atualizado: Jul 2025
  - Observações: documentação específica de integração Shopee (SHOPEE-INTEGRATION.md) e implementação prevista para V2; contém services/supabaseClient.ts (atenção: hardcoded URL/keys detectados).

- **siawshope** — https://github.com/jeanrrf/siawshope
  - Visibilidade: private
  - Linguagem: TypeScript
  - Observações: guia de cashback Shopee, deploy.sh (Vercel env list), plano de sincronização.

- **BACKEN_NODEJS_SIAW** — https://github.com/jeanrrf/BACKEN_NODEJS_SIAW
  - Visibilidade: private
  - Linguagem: TypeScript
  - Observações: Next.js API routes para geração de affiliate links (pages/api/shopee/generate-link-new.ts), database/setup_shopee_products.sql (schema e triggers para shopee_products), health checks, scripts.

- **VENDA_SHOPE_OFC** — https://github.com/jeanrrf/VENDA_SHOPE_OFC
  - Visibilidade: private
  - Linguagem: JavaScript
  - Observações: frontend React/Vite para afiliados (package.json com dependências para affiliate/shopee).

- **SIAW_MARTINS_SALES_PROJECT** — https://github.com/jeanrrf/SIAW_MARTINS_SALES_PROJECT
  - Visibilidade: private
  - Linguagem: JavaScript
  - Observações: frontend com ContactPage apontando salesmartins.siaw@gmail.com; deploy Vercel.

- **SIAW_MARTINS_SALES_FASHION** — https://github.com/jeanrrf/SIAW_MARTINS_SALES_FASHION
  - Visibilidade: private
  - Linguagem: JavaScript
  - Observações: UI catálogo / ProductCatalog (componentes React).

- **PRD_SIAW_VERCEL_SHO_MAE** — https://github.com/jeanrrf/PRD_SIAW_VERCEL_SHO_MAE
  - Visibilidade: public
  - Linguagem: JavaScript
  - Observações: deploy público (provável produção/demo da vitrine).

- **champion_shope** — https://github.com/jeanrrf/champion_shope
  - Visibilidade: private
  - Linguagem: HTML / Python (backend)
  - Observações: autenticação Shopee (backend/shopee_affiliate_auth.py), assets.md.

---

## Observações gerais sobre branches e histórico

- Muitos repositórios possuem múltiplos branches experimentais e nomes inconsistentes (ex.: OFIIAL, SALESOFICIAL). Há commits recentes em alguns e longos períodos sem atividade em outros — indica necessidade de governança em branches.

---

## Evidências / arquivos-chave observados

- salesmartins/README.md — visão geral, instruções de execução, estrutura frontend/backend.
- salesmartins/api.js — rotas principais (/, /vitrine, /api/products, /api/categories), autenticação com JWT (admin), exemplos de endpoints protegidos.
- BACKEN_NODEJS_SIAW/pages/api/shopee/generate-link-new.ts — implementação de geração de affiliate link via Shopee GraphQL; algoritmo de assinatura SHA256; verificação de credenciais em env.
- BACKEN_NODEJS_SIAW/database/setup_shopee_products.sql — schema da tabela shopee_products, triggers para updated_at, FTS (português), índices de performance.
- v2-of-sales-martins/SHOPEE-INTEGRATION.md e IMPLEMENTACAO-COMPLETA.md — especificações de integração, sync schedules, design de serviços (cache, analytics).
- siawshope/SHOPEE-CASHBACK-GUIDE.md e deploy.sh — guia de cashback e script de deploy com env vars listados (VITE_SUPABASE_URL, VITE_GEMINI_API_KEY, etc.) — atenção a expor env names.
- champion_shope/backend/shopee_affiliate_auth.py — lógica de assinatura, init_db (sqlite), e validação de env required vars.
- scripts/check-supabase.mjs — health check para Supabase (testes de leitura/escrita e RPCs).
- services/supabaseClient.ts (v2-of-sales-martins) — cliente Supabase com URL + anon key hardcoded (alto risco).

---

## Funcionalidades implementadas (tabela consolidada)

- Autenticação / Admin login (JWT)
- Catálogo de produtos (listagem, busca, filtros, paginação)
- Importador CSV (Shopee CSV downloader + parser + retries)
- Geração de affiliate links (Shopee GraphQL generateShortLink + assinatura SHA256)
- Sincronização Shopee ↔ Supabase (cron / scheduled syncs: 2h/24h, etc.)
- Cashback calculation & transactions
- Supabase schema & RPCs (upsert_rag_document etc.)
- Health checks & test writes
- Dashboard Admin / Designer / Automation UI
- Automation microservices (bot)
- IA / AINEX integration (models, agents, intent detection)

---

## Integrações externas encontradas

- Shopee Affiliate Open API (GraphQL)
- Supabase (Postgres)
- Vercel
- NVIDIA NIM (model provider)
- Google APIs
- Formspree
- Possíveis: Stripe / MercadoPago / PIX, Redis, Cloudinary

---

## Mapa de arquitetura (alto nível)

- Frontend: React (Vite/Next) — Vercel deployment
- API/Backend: Node.js / Next API / Express + Python services
- DB: Supabase (Postgres)
- Workers: Cron jobs and microservices (automation-bot)
- IA: AINEX/NIM models

Diagrama simplificado (Mermaid):

```mermaid
flowchart LR
  U[Usuário / Frontend] -->|HTTP| API[API (Next / Express)]
  API --> DB[Supabase / Postgres]
  API --> Shopee[Shopee Affiliate API]
  API --> Workers[Workers / Cron Jobs]
  Workers --> DB
  Workers --> Shopee
  API --> AINEX[AINEX / NVIDIA (IA)]
  style DB fill:#fef3c7,stroke:#333
  style Shopee fill:#fde68a,stroke:#333
  style AINEX fill:#c7f9f0,stroke:#333
```

---

## Recursos importantes (localizações)

- Importador CSV / download: SENTINNELL-ATOMATION---CVS-CONTROL-DATABASE/lib/shopee-api.ts
- Geração de affiliate links (Next API): BACKEN_NODEJS_SIAW/pages/api/shopee/generate-link-new.ts
- Schema DB (shopee_products + FTS): BACKEN_NODEJS_SIAW/database/setup_shopee_products.sql
- Cashback docs: siawshope/SHOPEE-CASHBACK-GUIDE.md
- V2 design & integration: v2-of-sales-martins/SHOPEE-INTEGRATION.md, IMPLEMENTACAO-COMPLETA.md
- Automation / microservices: SENTINNELL_IA_SIAW/microservices/automation-bot/README.md
- Exports/Backups: SENTINNELL_IA_SIAW/db/json_export/PRD_SIAW_SalesMartins/_metadata.json

---

## Riscos de segurança e qualidade (prioridade alta)

1. Hardcoded secrets/keys encontrados — rotacionar/remover chaves, mover para GitHub Secrets / Vault.
2. Exposição de service keys/anon keys no código — verificar e rotacionar.
3. Autenticação admin com credenciais no código — corrigir IMEDIATAMENTE.
4. Branches experimentais e múltiplas variantes do mesmo produto — consolidar.
5. Falta de testes automatizados e CI consistente — adicionar pipelines.
6. Manejo de tokens Shopee: cache/tokens/refresh precisam ser robustos.

---

## Código morto / dívida técnica

- Múltiplas UIs similares espalhadas — consolidar biblioteca de componentes.
- Branches antigos / nomes confusos — limpeza e arquivamento.
- Protótipos antigos que não fazem parte do core — mover para organização própria ou arquivar.

---

## Matriz resumida de projetos (resumo)

Projeto | Responsabilidade | Integrações | Reutilizável? | Necessita refatoração?
---|---|---:|:---:|---:
salesmartins | Vitrine + backend core | Shopee, Supabase | Sim (catálogo) | Alta (segurança + limpeza)
v2-of-sales-martins | Core V2 design & infra | Supabase, Shopee | Sim (planejado) | Média (modularizar)
BACKEN_NODEJS_SIAW | API / Link generation / DB schema | Shopee, Supabase | Sim | Alta (security + tests)
siawshope | Cashback engine + deploy | Supabase, Vercel, Shopee | Sim | Média
VENDA_SHOPE_OFC / SIAW_MARTINS_* | Frontend afiliados | Shopee | Parcial | Média

---

## Roadmap técnico (prioridade e entregas)

V2 (curto / mediano prazo — 6–12 semanas)
- Auditoria e remoção de segredos hardcoded; rotacionar chaves expostas.
- Refatorar a integração Shopee em um pacote/shared service.
- Unificar cliente Supabase e mover credenciais para env/secret manager.
- Criar pipeline CI (GitHub Actions) com lint/build/tests.
- Implantar monitoramento básico (Sentry / logs estruturados).

V3 (longo prazo — 12–24 meses)
- Arquitetura de serviços (ingestion, processing, api-gateway, workers).
- Serviço dedicado para vetorização/embeddings (vector DB).
- Integrar outros marketplaces e orquestração de sincronização.

---

## Ações recomendadas imediatas (top 6)

1. Rotacionar/retirar chaves hardcoded.
2. Implementar secret scanning.
3. Consolidar integração Shopee em serviço reutilizável.
4. Criar pipeline CI com checks de segurança.
5. Normalizar branches e arquivar protótipos.
6. Criar inventário de endpoints e mapa de permissões do Supabase.

---

## Limitações e observações finais

- A varredura analisou os repositórios e arquivos que estão acessíveis pelo seu perfil e indexados pelo GitHub. A busca de código do GitHub tem paginação/limitações — pode haver arquivos ou forks não indexados que não apareceram.
- Não recolhi nem revelei valores de segredos; apenas apontei locais onde chaves aparecem em texto. Recomendo rodar um scan completo de secrets (GitHub secret scanning / trufflehog / gitleaks).
- Não efetuei alterações em nenhum repositório.

---

Se desejar, posso agora gerar também um pacote ZIP com este Markdown e um CSV de inventário. Também posso criar issues automatizadas com os itens críticos de segurança para acompanhamento.

---

_Fim do relatório_
