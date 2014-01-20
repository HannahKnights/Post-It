class Comment < ActiveRecord::Base
    belongs_to :post

    validates :content, length: { maximum: 200 }
end
