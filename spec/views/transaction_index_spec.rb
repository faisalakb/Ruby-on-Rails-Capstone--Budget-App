require 'rails_helper'

RSpec.feature 'Transactions index page with sign-in', type: :feature do
  let(:user) { create(:user, email: 'test@example.com', password: 'password', name: 'Test User') }
  let(:category) { create(:category, user: user, name: 'Example Category') }

  scenario '1. redirects to the sign-in page when accessing transactions index' do
    visit category_transactions_path(category)
    expect(page).to have_current_path(new_user_session_path)
  end

  scenario '2. does not display sorting options on the sign-in page' do
    visit new_user_session_path
    expect(page).not_to have_content('Most ancient')
    expect(page).not_to have_content('Most recent')
  end

  scenario '3. does not display total amount and category details on the sign-in page' do
    visit new_user_session_path
    expect(page).not_to have_content('Transactions for: Example Category')
    expect(page).not_to have_content('Total Amount:')
  end

  scenario '4. does not display a table of transactions on the sign-in page' do
    visit new_user_session_path
    expect(page).not_to have_selector('table.table-striped')
    expect(page).not_to have_content('Name')
    expect(page).not_to have_content('Amount')
    expect(page).not_to have_content('Created At')
  end
end
