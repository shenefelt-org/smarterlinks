class Post < ApplicationRecord
  belongs_to :person
  has_many :user_comments, dependent: :destroy


  def title
    return self[:title] unless !self.title?
    "No title for #{self[:id]}"
  end

  def title?
    self[:title].present?
  end

  def body
    
    "#{self[:body]}" unless !self.body?

    "No body for #{self[:id]}"
  end

  # Correct way to make a predicate method
  def body?
    self[:body].present?
  end

  def delete
    update(deleted_at: Time.now)
  end

  def deleted?
    deleted_at.present?
  end

end
