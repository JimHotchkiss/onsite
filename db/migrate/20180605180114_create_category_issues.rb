class CreateCategoryIssues < ActiveRecord::Migration[5.1]
  def change
    create_table :category_issues do |t|
      t.string :name
      t.integer :category_id
      t.integer :issue_id
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
  end
end
