class Goal < ApplicationRecord
  validates :name, presence: true

  has_many :tasks

  def to_s
    name
  end
end
