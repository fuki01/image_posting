class User < ApplicationRecord
  validates :username, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  mount_uploader :image, ImageUploader
  has_many :context
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship", 
                                  foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower
  has_many :passive_relationships, class_name: "Relationship", 
                                   foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following

  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end
  
  def self.search(search)
    search ? where("username LIKE ?", "%#{search}%") : all
  end
end
