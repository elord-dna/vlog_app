class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :sno
      t.string :sname

      t.timestamps
    end
  end
end
