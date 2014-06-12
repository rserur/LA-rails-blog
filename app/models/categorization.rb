class Categorization < ActiveRecord::Base
  belongs_to :category
  belongs_to :article

  validates :category, presence: true
  validates :article, presence: true
end
