require 'rails_helper'
RSpec.describe "Likes", type: :feature do
  before do
    ActiveRecord::Base.logger = Logger.new(STDOUT)
  end
  it "お気に入りボタンが使用できること", js: true do
    user = FactoryBot.create(:user)
    another_user = FactoryBot.create(:user)
    context = FactoryBot.create(:context, user: user)
    visit root_path
    login another_user
    click_on "off_like_button_#{context.id}"
    visit root_path
    expect(page).to have_css "#on_like_button_#{context.id}"
  end
  
  it "お気に入りを解除できること", js: true do
    user = FactoryBot.create(:user)
    context = FactoryBot.create(:context, user: user)
    FactoryBot.create(:like, user: user, context: context)
    visit root_path
    login user
    click_on "on_like_button_#{ context.id }"
    expect(page).to have_css "#off_like_button_#{context.id}"
  end

  it "お気に入りページに表示されていること" do
    user = FactoryBot.create(:user)
    context = FactoryBot.create(:context, user: user)
    FactoryBot.create(:like, user: user, context: context)
    visit like_show_path(user.id)
    expect(page).to have_css "#like_imgs_#{context.id}"
  end
end
