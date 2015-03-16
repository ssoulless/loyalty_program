class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
    	t.belongs_to :client, index: true
    	t.belongs_to :store, index: true
    	t.text :description
    	t.integer :total_cents
    	t.integer :points_awarded
      	t.timestamps null: false
    end
  end
end
