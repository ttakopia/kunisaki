class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :name
      t.string :content
      t.string :title
      t.string :description
      t.string :address
      t.float  :latitude
      t.float  :longitude

      t.timestamps null: false
    end
  end
end
