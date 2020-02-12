class CreateHeaders < ActiveRecord::Migration[6.0]
  def change
    create_table :headers do |t|
      t.string :one
      t.string :two
      t.string :tree
      t.string :type
      t.string :local

      t.timestamps
    end
  end
end
