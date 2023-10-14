if Rails.env.development?
  AdminUser.create!(email: 'admin@mail.com', password: 'password', password_confirmation: 'password')
  Goal.create(name: "Aprender Linguagem Ruby", description: "Quero criar 10 algoritmos em até 3 meses")
  Goal.create(name: "Aprender Framework Rails", description: "Quero criar 5 projetos simples em até 3 meses")
end

