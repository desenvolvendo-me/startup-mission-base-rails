class Goal < ApplicationRecord
  has_many :tasks, dependent: :destroy, inverse_of: :goal

  enum status: { backlog: 'backlog', todo: 'todo', block: 'block',
                 doing: 'doing', done: 'done' }

  validates :name, presence: true

  accepts_nested_attributes_for :tasks, allow_destroy: true,
                                        reject_if: :all_blank

  def to_s
    name
  end
end
