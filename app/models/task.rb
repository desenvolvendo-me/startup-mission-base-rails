class Task < ApplicationRecord
  enum status: { backlog: 'backlog', todo: 'todo', block: 'block', doing: 'doing', done: 'done' }
end
