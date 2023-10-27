# OBJETIVO
Criar uma arquitetura de referência para se tornar uma máquina de criação de microsaas juntos com os alunos.

Para isso vamos deixar a criação de um projeto tanto facil quanto o https://bubble.io/, porém mais próximo do projeto
https://jumpstartrails.com/ ou https://avohq.io/.

Não queremos ser um NoCode, queremos facilitar a vida do Programador em criar novas ideias. 

Já que nossos alunos querem ser programadores e não empresários

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