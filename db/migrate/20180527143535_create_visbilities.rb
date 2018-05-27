class CreateVisbilities < ActiveRecord::Migration[5.0]
  def change
    create_table :visbilities do |t|
      t.integer :product_id
      t.integer :user_id
      t.datetime :date_display

      t.timestamps
    end
  end
end
