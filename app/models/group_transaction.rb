class GroupTransaction < ApplicationRecord
  belongs_to :category, foreign_key: 'group_id'
  belongs_to :user_transaction_detail
end
