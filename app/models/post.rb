class Post < ApplicationRecord

    validates :title, presence: true, 
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
    validates :content, length: {min: 100}
end
