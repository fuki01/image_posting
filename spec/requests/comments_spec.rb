require 'rails_helper'
RSpec.describe "Comments", type: :feature do
  before do
    ActiveRecord::Base.logger = Logger.new(STDOUT)
  end

  it 'コメントを投稿することができること' do
    user = FactoryBot.create(:user)
    context = FactoryBot.create(:context, user: user)
    visit root_path
    login user
    click_on "show-img"
    fill_in "comment_body",	with: "example comment"
    click_on "送信"
    expect(page).to have_content("example comment")
  end
end
