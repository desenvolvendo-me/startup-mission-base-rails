class Goal < ApplicationRecord
  validates :name, presence: true

  has_many :tasks, dependent: :destroy

  accepts_nested_attributes_for :tasks, allow_destroy: true

  def to_s
    name
  end
end
