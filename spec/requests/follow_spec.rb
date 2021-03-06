require 'rails_helper'
RSpec.describe "Follow", type: :feature do
  before do
    @user = FactoryBot.create(:user)
    @another_user = FactoryBot.create(:user)
    visit root_path
  end

  it 'フォローすることができ、フォロー中一覧に名前が表示されること' do
    login @user
    click_on "ユーザ検索"
    click_on "フォローする"
    click_on "マイページ"
    click_on "フォロー中"
    expect(page).to have_content(@another_user.username.to_s)
  end

  it 'フォローされたらフォロー一覧に名前が表示されること' do
    login @user
    click_on "ユーザ検索"
    click_on "フォローする"
    click_on "ログアウト"
    login @another_user
    click_on "マイページ"
    click_on "フォロワー"
    expect(page).to have_content(@user.username.to_s)
  end

  it 'フォローした投稿をフォロー投稿にて確認できること' do
    FactoryBot.create(:context, user: @user)
    visit root_path
    login @another_user
    click_on "ユーザ検索"
    click_on "フォローする"
    click_on "フォロー投稿"
    expect(page).to have_content(@user.username.to_s)
  end
end
