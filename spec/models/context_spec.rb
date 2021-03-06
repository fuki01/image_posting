require 'rails_helper'

RSpec.describe Context, type: :model do
  it "動物画像と本文とカテゴリーがあれば登録できる" do
    expect(FactoryBot.create(:context)).to be_valid
  end

  it "画像がなければ登録ができない" do
    expect(FactoryBot.build(:context, context_img: "")).not_to be_valid
  end

  it "本文がなければ登録ができない" do
    expect(FactoryBot.build(:context, body: "")).not_to be_valid
  end

  it "カテゴリーがなければ登録ができない" do
    expect(FactoryBot.build(:context, category: "")).not_to be_valid
  end
end
