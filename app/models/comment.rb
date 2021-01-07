class Comment < ApplicationRecord
	belongs_to :user
    belongs_to :shop
    with_options presence: true do
    validates :content
    # validates :score
    validates :content, length: {maximum: 200}
  end
end
