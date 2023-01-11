class Author < ApplicationRecord
  validates :name, presence: true
  validates_uniqueness_of :email
end
