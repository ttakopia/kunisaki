class Asset < ActiveRecord::Base
  belongs_to :picture
  has_attached_file :image, :styles => { :medium => "640x480>", 
                                         :thumb => "100x100>"}
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end
