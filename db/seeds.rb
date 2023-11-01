if Rails.env.development?
  AdminUser.create!(email: 'admin@mail.com',
                    password: 'password', password_confirmation: 'password')
  goal1 = Goal.create(name: 'Aprender Linguagem Ruby',
                      description: 'Quero criar 10 algoritmos em até 3 meses', status: 'done')
  Task.create(name: '1ª algoritmo', description: 'Criar o algoritmo bubble sort',
              status: "done", goal: goal1)

  goal2 = Goal.create(name: 'Aprender Framework Rails',
                      description: 'Quero criar 5 projetos simples em até 3 meses', status: 'done')
  Task.create(name: '1ª projeto', description: 'Criar a editora de livros',
              status: "done", goal: goal2)

  goal3 = Goal.create(name: 'Aprender Linguagem Python',
                      description: 'Quero criar 5 scripts úteis em até 2 meses', status: 'doing')
  Task.create(name: '1º script', description: 'Criar um script de automação de tarefas',
              status: "doing", goal: goal3)

  goal4 = Goal.create(name: 'Aprender Banco de Dados SQL',
                      description: 'Quero criar um banco de dados de livros em até 1 mês', status: 'todo')
  Task.create(name: '1ª tabela', description: 'Criar a tabela de livros',
              status: "todo", goal: goal4)

  goal5 = Goal.create(name: 'Aprender Front-End Development',
                      description: 'Quero construir um portfólio online em 2 semanas', status: 'doing')
  Task.create(name: 'Página inicial', description: 'Criar a página inicial do meu portfólio',
              status: "doing", goal: goal5)
end
