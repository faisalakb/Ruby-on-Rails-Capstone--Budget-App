class UserTransactionDetail < ApplicationRecord
  belongs_to :user
  has_many :group_transactions
  has_many :categories, through: :group_transactions

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end