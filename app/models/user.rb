class User < ApplicationRecord

  has_many :pictures, dependent: :destroy
  has_many :favorites

  has_secure_password
  mount_uploader :image, ImageUploader
  
end
