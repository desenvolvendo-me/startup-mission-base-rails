require 'rails_helper'

RSpec.describe Goal, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  context 'create' do
    before do
      create(:goal)
    end

    it 'one' do
      expect(Goal.count).to eq 1
    end
  end

end