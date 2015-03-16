class AddMissingFieldsToModels < ActiveRecord::Migration
  def change
  	add_column :clients, :gender, :string
  	add_column :stores, :pointsfirst, :integer
  	add_column :stores, :pointssecond, :integer
  	add_column :stores, :pointsthird, :integer
  	add_column :stores, :rewardfirst, :string
  	add_column :stores, :rewardsecond, :string
  	add_column :stores, :rewardthird, :string
  end
end
