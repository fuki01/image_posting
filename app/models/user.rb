class User < ApplicationRecord
  validates :username, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :image, ImageUploader
  has_many :context
end
