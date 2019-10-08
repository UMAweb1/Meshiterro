class PostImage < ApplicationRecord
	belongs_to :user
	attachment :image
	validates :shop_name, presence: true
	validates :image, presence: true
	has_many :post_comments, dependent: :destroy
	# いいね機能
	has_many :favorites, dependent: :destroy
        def favorited_by?(user)
          favorites.where(user_id: user.id).exists?
        end
end
