class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.string :author, null: false

      t.timestamps
    end
  end
end
