class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :image

  has_many :shops, dependent: :destroy
  #コメント機能中かテーブルのアソシエーション
  has_many :comments
  #いいね機能
  has_many :favorites
end
