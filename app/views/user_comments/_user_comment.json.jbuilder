json.extract! user_comment, :id, :person_id_id, :title, :body, :created_at, :updated_at
json.url user_comment_url(user_comment, format: :json)
