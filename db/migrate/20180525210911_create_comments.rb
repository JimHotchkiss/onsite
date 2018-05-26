class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :name
      t.text :body
      t.integer :issue_id
      t.integer :user_id

      t.timestamps
    end
  end
end
