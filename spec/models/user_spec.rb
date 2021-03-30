require 'rails_helper'

RSpec.describe User, type: :model do
  it "名前とメールアドレスとパスワードがあれば登録ができる" do
    expect(FactoryBot.create(:user)).to be_valid
  end

  it "名前がなければ登録ができない" do
    expect(FactoryBot.build(:user, username: "")).to_not be_valid 
  end

  it "メールアドレスがなければ登録ができない" do
    expect(FactoryBot.build(:user, email: "")).to_not be_valid 
  end

  it "メールアドレスの重複があれば登録ができない" do
    user1 = FactoryBot.create(:user,username: "fuki", email: "fuki@example.com")
    expect(FactoryBot.build(:user, username: "ziro", email: user1.email)).to_not be_valid
  end

  it "パスワードがなければ登録ができない" do
    expect(FactoryBot.build(:user, password: "")).to_not be_valid 
  end

  it "password_confirmationとpasswordが異なる場合保存できない" do 
    expect(FactoryBot.build(:user,password:"password",password_confirmation: "passward")).to_not be_valid 
  end 
end
