class AddActivityLogIdToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :activity_log_id, :integer
  end
end
