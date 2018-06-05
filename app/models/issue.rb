class Issue < ApplicationRecord
  has_many :category_issues
  has_many :categories, through: :category_issues
  has_many :comments, dependent: :destroy


  validates :title, presence: true
  validates :description, presence: true, length: {maximum: 150}
  validates :solution, presence: true
  validates :category_ids, presence: true
end
