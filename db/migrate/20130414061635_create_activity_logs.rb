class CreateActivityLogs < ActiveRecord::Migration
  def change
    create_table :activity_logs do |t|
      t.string :file, null: false, default: ""
      t.timestamps
    end
  end
end
