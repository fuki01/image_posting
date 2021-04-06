require 'rails_helper'
RSpec.describe "Users", type: :feature do
  before do
    @user = FactoryBot.create(:user)
  end

  it "pull downメニューからユーザーの編集にいけること" do
    visit    root_path
    login    @user
    click_on "設定"
    expect(page).to have_content("ユーザー編集")
  end

  it "ユーザー詳細ページからユーザー編集ページに行けること" do
    FactoryBot.create(:context, user: @user)
    visit root_path
    login @user
    click_on "マイページ"
    click_on "ユーザー編集"
    expect(page).to have_content("ユーザー編集")
  end

  it '他のユーザーには編集ボタンが存在しないこと' do
    another_user = FactoryBot.create(:user)
    visit root_path
    login @user
    visit user_path(another_user.id)
    expect(page).not_to have_content("ユーザー編集")
  end

  it 'ユーザーネームの編集が可能であること' do
    visit root_path
    login @user
    visit edit_user_registration_path
    user_edit(@user)
    expect(@user.reload.username).to eq "edit_name"
  end

  it 'メールアドレスの編集が可能であること' do
    visit root_path
    login @user
    visit edit_user_registration_path
    user_edit(@user)
    expect(@user.reload.email).to eq "edit_test@example.com"
  end
end
