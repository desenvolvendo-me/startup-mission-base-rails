# == Schema Information
#
# Table name: clients
#
#  id                   :bigint           not null, primary key
#  current_period_end   :datetime
#  current_period_start :datetime
#  document             :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  stripe_customer_id   :string
#  user_id              :bigint
#
# Indexes
#
#  index_clients_on_user_id  (user_id)
#
require 'rails_helper'

RSpec.describe Client, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
