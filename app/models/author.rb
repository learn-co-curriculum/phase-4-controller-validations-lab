class Author < ApplicationRecord
  validates :name, length: { minimum: 1 }, presence: true
  validates :email, uniqueness: { case_sensitive: true }
end
