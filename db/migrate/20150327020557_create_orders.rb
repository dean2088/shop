class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :uname, limit: 30
      t.string :uaddress, limit: 30
      t.string :upost, limit: 30
      t.string :uphone, limit: 30
      t.string :uhomephone, limit: 30
      t.float :pirce

      t.timestamps null: false
    end
  end
end
