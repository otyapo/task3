class Book < ApplicationRecord
	belongs_to :user

    validates :body, length: {in: 1..200}

end
