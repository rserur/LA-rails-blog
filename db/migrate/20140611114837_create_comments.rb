class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :article_id, null: false
      t.string :body, null: false
      t.string :author, null: false

      t.timestamps
    end
  end
end
