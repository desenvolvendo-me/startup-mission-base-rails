# == Schema Information
#
# Table name: clients
#
#  id         :bigint           not null, primary key
#  document   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_clients_on_user_id  (user_id)
#
FactoryBot.define do
  factory :client do
    document { FFaker::IdentificationBR.pretty_cpf }
    association :user, factory: :user
  end
end
