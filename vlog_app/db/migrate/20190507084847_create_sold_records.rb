class CreateSoldRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :sold_records do |t|
      t.string :code
      t.string :name
      t.int :num
      t.string :unit
      t.double :price
      t.string :total
      t.string :other
      t.string :billNo

      t.timestamps
    end
  end
end
