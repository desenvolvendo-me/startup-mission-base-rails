if Rails.env.development?
  AdminUser.create!(email: 'admin@mail.com',
                    password: 'password', password_confirmation: 'password')
  goal1 = Goal.create(name: 'Aprender Linguagem Ruby',
                      description: 'Quero criar 10 algoritmos em até 3 meses')
  Task.create(name: '1ª agoritmo', description: 'Criar o algoritmo bubble sort',
              status: "todo", goal: goal1)

  goal2 = Goal.create(name: 'Aprender Framework Rails',
                      description: 'Quero criar 5 projetos simples em até 3 meses')
  Task.create(name: '1ª projeto', description: 'Criar a editora de livros',
              status: "todo", goal: goal2)
end
