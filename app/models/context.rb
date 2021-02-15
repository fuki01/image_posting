class Context < ApplicationRecord
  mount_uploader :context_img, ContextImgUploader
  validates :context_img, presence: true
  validates :category,    presence: true, length: {maximum:10}
  validates :body,        presence: true,     length: {maximum:200}
  belongs_to :user, foreign_key: "user_id"
  has_many :comments
  def self.search(search)
    search ? where("body OR category LIKE ?", "%#{search}%") : all
  end
  def self.category(search)
    search ? where("category LIKE ?", "%#{search}%") : all
  end
end
