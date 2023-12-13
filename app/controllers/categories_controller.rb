class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Category.includes(:user_transaction_details)
  end

  def show
    @category = Category.find(params[:id])
    @transactions = @category.user_transaction_details.order(created_at: :desc)
    @total_amount = @category.total_amount
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.build(category_params)
  
    if @category.save
      redirect_to categories_path, notice: 'Category was successfully created.'
    else
      render :new
    end
  end
  
  

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
