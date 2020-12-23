class Shop < ApplicationRecord
	attachment :image
	#画像を挿入したい側に入れ込む
	#image_idのように_idを含めない
end
