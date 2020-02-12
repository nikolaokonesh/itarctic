class CreateYoutubes < ActiveRecord::Migration[6.0]
  def change
    create_table :youtubes do |t|
      t.string :url
      t.references :commentable, null: false, polymorphic: true
      t.string :type
      t.string :local

      t.timestamps
    end
  end
end
