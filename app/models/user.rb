class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :user_transaction_details
  has_many :categories

  validates :name, presence: true
end
