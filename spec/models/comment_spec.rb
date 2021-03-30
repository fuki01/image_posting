require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "コメント本文があれば登録できること" do
    expect(FactoryBot.create(:comment)).to be_valid
  end
  it "コメント本文がなければ登録できないこと" do
    expect(FactoryBot.build(:comment, body: "")).to_not be_valid 
  end
end
