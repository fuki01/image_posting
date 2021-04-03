require 'rails_helper'
RSpec.feature "Contexts", type: :feature do
  it "pull downメニューからユーザーの編集にいけること" do
    user = FactoryBot.create(:user)
    visit    root_path
    login    user
    click_on "設定"
    expect(page).to have_content("ユーザー編集")
  end

  it "ユーザー詳細ページからユーザー編集ページに行けること" do
    user = FactoryBot.create(:user)
    FactoryBot.create(:context, user: user)
    visit root_path
    login user
    click_on "マイページ"
    click_on "ユーザー編集"
    expect(page).to have_content("ユーザー編集")
  end
  
  it '他のユーザーには編集ボタンが存在しないこと' do
    user = FactoryBot.create(:user)
    another_user = FactoryBot.create(:user)
    visit root_path
    login user
    visit user_path(another_user.id)
    expect(page).not_to have_content("ユーザー編集")
  end

  it 'ユーザーネームの編集が可能であること' do
    user = FactoryBot.create(:user)
    visit root_path
    login user
    visit edit_user_registration_path
    user_edit(user)
    expect(user.reload.username).to eq "edit_name"
   end

   it 'メールアドレスの編集が可能であること' do
    user = FactoryBot.create(:user)
    visit root_path
    login user
    visit edit_user_registration_path
    user_edit(user)
    expect(user.reload.email).to eq "edit_test@example.com"
   end
   
end