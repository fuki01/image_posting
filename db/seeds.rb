require "csv"

CSV.foreach('db/csv/sample_seed_user.csv', headers: true) do |row|
  User.create!(
    email: Faker::Internet.email,
    username: row['username'],
    password: row['password'],
    password_confirmation: row['password']
  )
end

CSV.foreach('db/csv/sample_seed_context.csv', headers: true) do |row|
  Context.create!(
    user_id: row['user_id'],
    body: row['body'],
    category: row['category'],
    context_img: open("./app/assets/sample_images/ファイル #{rand(1..59)}.jpeg")
  )
end
