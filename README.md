# OBJETIVO
Criar uma arquitetura de referência para se tornar uma máquina de criação de microsaas juntos com os alunos.

Para isso vamos deixar a criação de um projeto tanto facil quanto o https://bubble.io/, porém mais próximo do projeto
https://jumpstartrails.com/ ou https://avohq.io/ ou https://shipfa.st/.

Não queremos ser um NoCode, queremos facilitar a vida do Programador em criar novas ideias. 

Já que nossos alunos querem ser programadores e não empresários
# API
Como usar o swagger para documentar as APIs,https://www.youtube.com/watch?v=4_s66AeuM5c

# QUALIDADE
```
Teste, ativado
Lint, ativado
Cobertura, 80%
Score, 90
```
## ANÁLISE
### Teste e Cobertura
    bundle exec rspec
### Lint
    bundle exec rubocop
### Score
    bundle exec rubycritic

# CONFIGURAÇÃO
## DOCKER
### CRIANDO
docker-compose up --build
### EXECUTANDO
docker compose up
docker-compose run web rails db:create
docker-compose run web rails db:migrate
docker-compose run web rspec