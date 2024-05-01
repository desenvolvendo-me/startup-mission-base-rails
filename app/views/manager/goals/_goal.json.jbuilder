json.extract! goal, :id, :name, :description, :created_at, :updated_at
json.url manager_goal_url(goal, format: :json)
