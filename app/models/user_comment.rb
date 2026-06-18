class UserComment < ApplicationRecord
  belongs_to :person
  belongs_to :post, optional: true
  Faker::
end
