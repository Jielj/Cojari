class ChangeAttributeType < ActiveRecord::Migration[7.0]
  def change
    change_column :requests, :request_title, :text
  end
end
