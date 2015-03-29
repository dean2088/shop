class CreateWares < ActiveRecord::Migration
  def change
    create_table :wares do |t|
      t.string :wname, limit: 30
      t.text :wdesc
      t.string :wtype, limit: 30
      t.string :wfactory, limit: 30
      t.float :wprice
      t.string :wimg, limit: 30

      t.timestamps null: false
    end
  end
end
