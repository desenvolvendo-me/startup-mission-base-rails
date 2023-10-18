# CONFIGURATION
## DOCKER
### CREATING
docker-compose up --build
### RUNNING
docker compose up
docker-compose run web rails db:create
docker-compose run web rails db:migrate
docker-compose run web rspec