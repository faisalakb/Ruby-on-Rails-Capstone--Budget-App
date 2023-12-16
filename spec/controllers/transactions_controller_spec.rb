require 'rails_helper'

RSpec.describe TransactionsController, type: :controller do
  describe 'GET #index' do
    it 'redirects to sign-in page when user is not signed in' do
      user = create(:user, email: 'test@example.com', password: 'password', name: 'Test User')

      category = create(:category, user: user)

      get :index, params: { category_id: category.id }

      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
