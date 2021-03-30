FactoryBot.define do
  factory :context do
    context_img {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/ファイル 5.jpeg'))}
    body {"sample body"}
    category {"category"}
    association :user
  end
end
