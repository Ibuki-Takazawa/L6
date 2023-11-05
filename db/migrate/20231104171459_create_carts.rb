class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    unless ActiveRecord::Base.connection.table_exists?('carts')
      create_table :carts do |t|
  
        t.timestamps
      end
    end
  end
end
