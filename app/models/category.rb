class Category < ApplicationRecord
  belongs_to :user
  has_many :group_transactions, foreign_key: 'group_id'
  has_many :user_transaction_details, through: :group_transactions

  validates :name, presence: true
  validates :icon, presence: true

  def total_amount
    user_transaction_details.sum(:amount)
  end
end
