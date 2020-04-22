# frozen_string_literal: true

User.create!(name: 'Test User',
             email: 'test@example.com',
             password: 'test123',
             password_confirmation: 'test123',
             image: open('app/assets/images/user_image/business_man_macho.png')
)

20.times do |n|
  name = Faker::Name.name
  email = "example-#{n + 1}@railstutorial.org"
  password = 'password'
  image = open("app/assets/images/user_image/user_image.png")
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               image: image,
               activated: true,
               activated_at: Time.zone.now)
end

10.times do |n|
  store_name = "#{n + 1}-cafe"
  address = "#{n + 1}-address"
  address_prefectures = (n + 1).to_i
  image = open("app/assets/images/cafe_shop/cafe(#{n + 1}).jpeg")
  time_start = "#{n + 7}:00"
  time_end = "#{n + 17}:00"
  #  environment = n.to_s
  #  evaluation = n.to_s
  user_id = '1'
  Post.create!(store_name: store_name,
               address: address,
               address_prefectures: address_prefectures,
               image: image,
               #               environment: environment,
               #               evaluation: evaluation,
               time_start: time_start,
               time_end: time_end,
               user_id: user_id)
end

5.times do |n|
  address = "#{n + 1}-address"
  address_prefectures = (n + 1).to_i
  image = open("app/assets/images/cafe_shop/cafe(#{n + 1}).jpeg")
  time_start = "#{n + 7}:00"
  time_end = "#{n + 17}:00"
  #  environment = n.to_s
  #  evaluation = n.to_s
  user_id = (n + 1).to_s
  store_name = "User.#{user_id}-cafe"
  Post.create!(store_name: store_name,
               address: address,
               address_prefectures: address_prefectures,
               image: image,
               #               environment: environment,
               #               evaluation: evaluation,
               time_start: time_start,
               time_end: time_end,
               user_id: user_id)
end

users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
