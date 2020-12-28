class Shop < ApplicationRecord
	attachment :image
	#画像を挿入したい側に入れ込む
	#image_idのように_idを含めない
	belongs_to :user
    #検索機能
	def self.search(search)
      return Shop.all unless search
      Shop.where(['name LIKE ?', "%#{search}%"])
    end
    #コメント機能中かテーブルのアソシエーション
    has_many :comments
end