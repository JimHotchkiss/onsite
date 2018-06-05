class CategoryIssue < ApplicationRecord
  belongs_to :category
  belongs_to :issue
end
