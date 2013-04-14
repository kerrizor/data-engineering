class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :customer
      t.references :merchant
      t.references :item
      t.integer :item_quantity, :null => false, :default => ""
      t.timestamps
    end
  end
end
