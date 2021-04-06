require 'rails_helper'
RSpec.describe "Contexts", type: :feature do
  before do
    @user = FactoryBot.create(:user)
  end

  it 'Contextが投稿ができること' do
    visit root_path
    login @user
    expect {
      click_on "投稿する！"
      context_create
    }.to change(@user.context, :count).by(1)
  end

  it 'Contextが削除できること' do
    expect {
      FactoryBot.create(:context, user: @user)
      visit root_path
      login @user
      click_on "show-img"
      click_on "削除"
    }.to change(@user.context, :count).by(0)
  end

  it 'Contextが編集できること' do
    context = FactoryBot.create(:context, user: @user)
    visit root_path
    login @user
    click_on "show-img"
    click_on "編集"
    context_edit
    expect(@user.context).not_to eq context
  end
end
