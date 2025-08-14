class Author < ApplicationRecord
  validates :name, presence: :true
  validates :email, uniqueness: {case_sensitivity: :true}
end
