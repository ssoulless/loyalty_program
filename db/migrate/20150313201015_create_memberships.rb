class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
    	t.belongs_to :client, index: true
    	t.belongs_to :store, index: true
    	t.integer :points
      	t.timestamps null: false
    end
  end
end
