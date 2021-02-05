class Context < ApplicationRecord
  mount_uploader :context_img, ContextImgUploader
  validates :context_img, presence: true
  validates :category, presence: true, length: {maximum:10}
  validates :body, presence: true,     length: {maximum:200}
  belongs_to :user, foreign_key: "user_id"
  def self.search(cloumn,search="")
    search ? where("body LIKE ?", "%#{search}%") : all
end
end
