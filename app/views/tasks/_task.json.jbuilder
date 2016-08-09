json.extract! task, :id, :title, :body, :is_done, :user_id, :created_at, :updated_at
json.url task_url(task, format: :json)