class Favorite < ApplicationRecord
	#そちらに対しても複数持たれる側なので子になりhasmanyになる
	belongs_to :user
    belongs_to :shop
end