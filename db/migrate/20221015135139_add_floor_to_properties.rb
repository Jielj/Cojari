class AddFloorToProperties < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :floor, :string
    rename_column :properties, :propertie_number, :property_number
    add_column :coproperties, :building_type, :string
  end
end
