class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|
      t.string :request_title
      t.date :request_date
      t.string :request_status
      t.references :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end
