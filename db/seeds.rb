100.times do |n|
    username = Faker::Name.name
    email    = Faker::Internet.email
    password = "password"
    User.create!(
        username: username,
        email:    email,
        password: password,
        password_confirmation: password,
    )
end
100.times do |n|
    user_id  = rand(2..80)
    body     = "sample text"
    category = Faker::Creature::Animal.name
    Context.create!(
        user_id:     user_id,
        body:        body,
        category:    category,
        context_img: open("./app/assets/images/dog.jpg")
    )
end