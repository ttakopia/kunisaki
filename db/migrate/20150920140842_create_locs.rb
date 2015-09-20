class CreateLocs < ActiveRecord::Migration
  def change
    create_table :locs do |t|

      t.timestamps null: false
    end
  end
end
