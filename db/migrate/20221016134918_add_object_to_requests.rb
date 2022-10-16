class AddObjectToRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :requests, :object, :string
  end
end
