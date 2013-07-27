class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :company
      t.string :role
      t.string :initial
      t.string :final
      t.text :functions

      t.timestamps
    end
  end
end
