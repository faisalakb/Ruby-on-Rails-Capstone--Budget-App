require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  describe 'GET #show' do
    it 'renders the show template' do
      # Create a category
      category = create(:category)

      # Perform a GET request to the show action
      get :show, params: { id: category.id }

      # Expect the response to redirect to the sign-in page
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  # Add similar tests for GET #new and POST #create actions
end
