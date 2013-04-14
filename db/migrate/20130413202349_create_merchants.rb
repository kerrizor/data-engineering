class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.string :name,    :null => false, :default => ""
      t.string :address, :null => false, :default => ""
      t.timestamps
    end
  end
end
