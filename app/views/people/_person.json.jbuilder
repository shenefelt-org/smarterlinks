json.extract! person, :id, :name, :first_name, :last_name, :id_number, :created_at, :updated_at
json.url person_url(person, format: :json)
