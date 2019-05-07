class CreateStoreRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :store_records do |t|
      t.string :code
      t.string :name
      t.string :num
      t.string :unit

      t.timestamps
    end
  end
end
