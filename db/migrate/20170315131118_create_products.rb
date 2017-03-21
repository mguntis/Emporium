class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :seller_info
      t.text :description
      t.integer :amount
      t.string :types
      t.string :category
      t.float :price
      t.timestamp :created_at
      t.timestamp :updated_at

      t.timestamps null: false
    end
  end
end
