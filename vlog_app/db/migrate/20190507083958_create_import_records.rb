class CreateImportRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :import_records do |t|
      t.string :code
      t.string :name
      t.int :num
      t.string :unit
      t.double :price
      t.double :total
      t.string :other

      t.timestamps
    end
  end
end
