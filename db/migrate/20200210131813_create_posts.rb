class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :description
      t.boolean :top
      t.string :slug
      t.string :type
      t.string :local

      t.timestamps
    end
    add_index :posts, :slug, unique: true
  end
end
