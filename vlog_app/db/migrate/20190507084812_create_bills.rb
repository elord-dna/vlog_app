class CreateBills < ActiveRecord::Migration[5.2]
  def change
    create_table :bills do |t|
      t.string :no
      t.string :phone
      t.string :addr
      t.string :customer
      t.float :total

      t.timestamps
    end
  end
end
