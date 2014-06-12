class Comment < ActiveRecord::Base
  belongs_to :article

  validates :article, presence: true
  validates :body, presence: true
  validates :author, presence: true
end
