class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :description, :null => false, :default => ""
      t.decimal :price, :precision => 8, :scale => 2
      t.timestamps
    end
  end
end
