class Post < ApplicationRecord
  validates :title, presence: :true
  validates :category, inclusion: { in: %w[Fiction Non-Fiction]}
end
