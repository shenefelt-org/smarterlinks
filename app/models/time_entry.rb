class TimeEntry < ApplicationRecord
  belongs_to :person, foreign_key: :person_id, optional: true
end