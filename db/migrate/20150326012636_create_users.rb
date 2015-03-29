class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uname, limit: 30
      t.string :upwd, limit: 30
      t.string :umail, limit: 30
      t.string :uphone, limit: 30
      t.string :uaddress, limit: 30
      t.string :uimpower, limit: 30

      t.timestamps null: false
    end
  end
end
