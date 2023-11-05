class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    unless ActiveRecord::Base.connection.table_exists?('products')
      create_table :products do |t|
        t.string :name
        t.integer :price
  
        t.timestamps
      end
    end
  end
end
