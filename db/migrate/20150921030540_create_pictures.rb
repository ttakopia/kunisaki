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

      t.string :access
      t.string :worktime
      t.string :rest
      t.string :fee
      t.string :credit
      t.string :parking
      t.string :parkingnumber
      t.string :parkingfee
      t.string :phonenumber 

      t.timestamps null: false
    end
  end
end
