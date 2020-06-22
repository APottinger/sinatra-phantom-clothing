class CreateProductsTable < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :item
      t.integer :price
      t.string :brand
    end
  end
end
