require 'rails_helper'
RSpec.describe "Category", type: :feature do
  before do
    @user = FactoryBot.create(:user)
    @context = FactoryBot.create(:context, user: @user)
  end

  it '動物のカテゴリーが表示されていること' do
    visit root_path
    login @user
    click_on "動物カテゴリー"
    expect(page).to have_content(@context.category.to_s)
    click_on @context.category.to_s
    expect(page).to have_content(@context.body.to_s)
  end
end
