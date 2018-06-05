class Category < ApplicationRecord
  has_many :category_issues
  has_many :issues, through: :category_issues
end
