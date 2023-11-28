json.extract! task, :id, :name, :priority, :user_id, :assignee_id, :created_at, :updated_at
json.url task_url(task, format: :json)
