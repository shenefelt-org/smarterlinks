json.extract! person_information, :id, :address, :dob, :created_at, :updated_at
json.url person_information_url(person_information, format: :json)
