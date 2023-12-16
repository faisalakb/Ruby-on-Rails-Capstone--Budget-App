class TransactionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @category = Category.includes(:user_transaction_details).find(params[:category_id])
    @transactions = @category.user_transaction_details.order(created_at: :desc)
    @total_amount = @category.total_amount
  end

  def new
    @category = Category.find(params[:category_id])
    @transaction = UserTransactionDetail.new
  end

  def create
    @category = Category.includes(:user_transaction_details).find(params[:category_id])
    @transaction = current_user.user_transaction_details.build(transaction_params)
    @transaction.group_transactions.build(category: @category)

    if @transaction.save
      redirect_to category_transactions_path(@category), notice: 'Transaction was successfully created.'
    else
      render :new
    end
  end

  private

  def transaction_params
    params.require(:user_transaction_detail).permit(:name, :amount)
  end
end
