class CreateResidents < ActiveRecord::Migration[6.0]
  def change
    create_table :residents do |t|
      t.string :name
      t.string :type
      t.string :local

      t.timestamps
    end
  end
end
