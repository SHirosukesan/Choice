class Articl < ApplicationRecord
  #対象となるモデルに次の記述を追加すると、 geocoder が address から経度・緯度を取得してくれます。
  geocoded_by :address
  after_validation :geocode
end
