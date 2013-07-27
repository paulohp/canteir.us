class CreateAcademics < ActiveRecord::Migration
  def change
    create_table :academics do |t|
      t.string :name
      t.string :degree
      t.string :institution
      t.string :initial
      t.string :final

      t.timestamps
    end
  end
end
