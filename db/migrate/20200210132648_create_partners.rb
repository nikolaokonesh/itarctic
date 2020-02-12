class CreatePartners < ActiveRecord::Migration[6.0]
  def change
    create_table :partners do |t|
      t.string :title
      t.string :url
      t.string :description
      t.string :type
      t.string :local

      t.timestamps
    end
  end
end
