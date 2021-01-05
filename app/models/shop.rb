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
  #いいね機能
  has_many :favorites
  #shopがファボしているかどうかを判定する。
  #ビューで表示するとなると↓
  #if @tweet.favorited_by?(current_user)
  #if @tweet.favorites.where(user_id: current_user.id).exists?
  #これと同じことになる。
  #shopモデルのfavoriteテーブルからuser_idがcurrent_userのものを持ってくる
  #favoritesテーブルにuser_idにcurrnt_userが入っているものに、turueがfalseを返す。
  def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
  end
end