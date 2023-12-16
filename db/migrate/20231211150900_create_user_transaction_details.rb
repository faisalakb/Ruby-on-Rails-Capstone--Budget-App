class CreateUserTransactionDetails < ActiveRecord::Migration[7.1]
  def change
    create_table :user_transaction_details do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.decimal :amount, precision: 10, scale: 2
      t.timestamps
    end
  end
end
