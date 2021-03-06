class User < ApplicationRecord
  before_validation { email.downcase! }

  has_many :pictures, dependent: :destroy
  has_many :favorites

  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, uniqueness: true
  has_secure_password

  mount_uploader :image, ImageUploader
  
end
