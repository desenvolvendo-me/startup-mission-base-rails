class Goal < ApplicationRecord
  validates :name, presence: true

  def to_s
    name
  end
end
