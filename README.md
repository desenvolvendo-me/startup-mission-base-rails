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