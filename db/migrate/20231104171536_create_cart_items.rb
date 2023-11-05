class CreateCartItems < ActiveRecord::Migration[7.0]
  def change
    unless ActiveRecord::Base.connection.table_exists?('cart_items')
      create_table :cart_items do |t|
        t.integer :qty, default: 0
        t.references :product, null: false, foreign_key: true
        t.references :cart, null: false, foreign_key: true
  
        t.timestamps
      end
    end
  end
end
