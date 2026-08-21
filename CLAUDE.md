# Projeto DVOps One — contexto para assistentes (Claude)

Este repositório é a base única do projeto **DVOps One**, sincronizada por Git
entre duas máquinas:
- Notebook `sal-g1525`: `C:\Users\rodsa\DvOps One`
- Desktop  `sal-desk`:  `C:\Users\Saldanha\DvOps One`
- Remoto (privado): https://github.com/saldarod/dvops-one

## O que é a DVOps One
Consultoria de **DevOps** com frentes de **FinOps** e **Observabilidade**;
posicionamento: eficiência operacional em nuvem (estável, observável e com custo
sob controle), metodologia própria e senioridade (30+ anos). Fundador: Rod
Saldanha (Campinas/SP).

## Mapa dos arquivos
- `Analise_Competitiva_DVOps_One.md` / `.docx` — análise competitiva de 30 empresas
  de DevOps/DevSecOps no Brasil + 9 diferenciais recomendados.
- `Panorama_DevOps_Brasil.md` / `.xlsx` — matriz comparativa das 30 empresas.
- `Conversa_DVOps_One.md` — transcript da pesquisa que gerou a análise.
- `site/` — preview/protótipo do site da DVOps One (trabalho em andamento).
- `sync.sh` / `sync-run.bat` — sincronização automática entre as máquinas (ver abaixo).

## Sincronização
Os scripts `sync.sh` (Git Bash) e `sync-run.bat` (Agendador do Windows) fazem:
commit do que mudou → `git pull --rebase --autostash` → `git push`. Rodam a cada
15 min e no logon. O log `.sync.log` é ignorado pelo Git.

## Orientação para assistentes
- Trate este diretório como a fonte de verdade do projeto.
- Ao criar/editar o site, trabalhe dentro de `site/`.
- Documentos de negócio (análise, panorama) ficam na raiz.
- Antes de editar, `git pull`; ao terminar, deixe o commit/push (o sync cobre isso).
