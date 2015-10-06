class Picture < ActiveRecord::Base
  has_many :users
  has_many :assets
  accepts_nested_attributes_for :assets, :allow_destroy => true
   # ファイルの拡張子を指定（これがないとエラーが発生する）
  geocoded_by :address
  after_validation :geocode
end