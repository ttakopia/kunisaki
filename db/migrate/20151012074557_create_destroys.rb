class CreateDestroys < ActiveRecord::Migration
  def change
    create_table :destroys do |t|
      t.string :garary

      t.timestamps null: false
    end
  end
end
