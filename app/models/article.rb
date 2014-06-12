class Article < ActiveRecord::Base
  has_many :comments
  has_many :categorizations
  has_many :categories, through: :categorizations

  validates :title, presence: true
  validates :body, presence: true
  validates :author, presence: true

  def category_names
    names = []

    categories.each do |category|
      names << category.name
    end

    names.join(', ')
  end
end
