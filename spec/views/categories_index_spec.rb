# spec/views/categories_index_spec.rb
require 'rails_helper'

RSpec.describe 'categories/index', type: :view do
  let(:user) { create(:user) }

  before do
    allow(view).to receive(:current_user).and_return(user)
    assign(:categories, create_list(:category, 3, user:))
    render
  end

  it 'displays sorting options' do
    expect(rendered).to have_content('Most ancient')
    expect(rendered).to have_content('Most recent')
  end

  it 'displays total amount and category details' do
    expect(rendered).to have_content('Total Amount:')
  end

  it 'displays a list of categories' do
    expect(rendered).to have_selector('.category', count: 0)
  end
end
