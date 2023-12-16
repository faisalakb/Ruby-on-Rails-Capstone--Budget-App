class CreateGroupTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :group_transactions do |t|
      t.references :group, foreign_key: true
      t.references :user_transaction_detail, foreign_key: true
      t.timestamps
    end
  end
end
