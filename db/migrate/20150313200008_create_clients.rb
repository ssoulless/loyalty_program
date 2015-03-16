class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :full_name
      t.string :cedula
      t.string :phone
      t.date :birthday
      t.integer :age
      t.string :address
      t.integer :points

      t.timestamps null: false
    end
  end
end
