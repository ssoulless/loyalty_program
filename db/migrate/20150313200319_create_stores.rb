class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.string :type
      t.string :address
      t.string :phone
      t.text :description

      t.timestamps null: false
    end
  end
end
