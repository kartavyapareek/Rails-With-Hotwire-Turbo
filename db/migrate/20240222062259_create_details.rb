class CreateDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :details do |t|
      t.string :title
      t.string :name, null: false
      t.integer :age
      t.string :phone
      t.references :person, null: false, foreign_key: true
      t.timestamps
    end
  end
end
