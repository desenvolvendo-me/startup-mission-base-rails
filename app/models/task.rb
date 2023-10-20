class Task < ApplicationRecord
  belongs_to :goal

  enum status: { backlog: 'backlog', todo: 'todo', block: 'block',
                 doing: 'doing', done: 'done' }

  validates :name, presence: true
end
