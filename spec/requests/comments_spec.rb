require 'rails_helper'
RSpec.describe "Comments", type: :feature do
  before do
    @user = FactoryBot.create(:user)
    FactoryBot.create(:context, user: @user)
  end

  it 'コメントを投稿することができること' do
    visit root_path
    login @user
    click_on "show-img"
    fill_in "comment_body",	with: "example comment"
    click_on "送信"
    expect(page).to have_content("example comment")
  end
end
