class Picture < ApplicationRecord
  has_many :favorites, dependent: :destroy
  belongs_to :user, optional: true
end
