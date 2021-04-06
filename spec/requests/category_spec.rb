require 'rails_helper'
RSpec.describe "Category", type: :feature do
  before do
    ActiveRecord::Base.logger = Logger.new(STDOUT)
  end
  it '動物のカテゴリーが表示されていること' do
    user = FactoryBot.create(:user)
    context = FactoryBot.create(:context, user: user)
    visit root_path
    login user
    click_on "動物カテゴリー"
    expect(page).to have_content("#{context.category}")
    click_on "#{context.category}"
    expect(page).to have_content("#{context.body}")
  end
end
