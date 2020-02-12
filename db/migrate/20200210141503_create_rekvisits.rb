class CreateRekvisits < ActiveRecord::Migration[6.0]
  def change
    create_table :rekvisits do |t|
      t.string :title
      t.string :type
      t.string :local

      t.timestamps
    end
  end
end
