class ChangeColumnsTypeName < ActiveRecord::Migration
  def change
  	rename_column :stores, :type, :type_of_store
  end
end
