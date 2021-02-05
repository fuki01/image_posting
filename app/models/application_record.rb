class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  def self.search(cloumn,search="")
    search ? where("#{clomun} LIKE ?", "%#{search}%") : all
end
end
