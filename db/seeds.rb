# frozen_string_literal: true

User.create!(name: 'テストユーザー',
             email: 'test@example.com',
             password: 'test123',
             password_confirmation: 'test123',
             image: open('app/assets/images/user_image/business_man_macho.png'),
             self_introduction: '初めまして！
最近、coffeeappをはじめたものです！
よろしくお願いします！',
             activated: true,
             activated_at: Time.zone.now)

User.create!(name: '北海道 太郎',
             email: 'hokkaidou@example.com',
             password: 'password',
             password_confirmation: 'password',
             image: open('app/assets/images/user_image/business_man_macho.png'),
             self_introduction: '北海道生まれの北海道育ちです。
北海道にあるオススメのカフェを紹介したいと思います。',
             activated: true,
             activated_at: Time.zone.now)

User.create!(name: '飯塚 長崎',
             email: 'nagasaki@example.com',
             password: 'password',
             password_confirmation: 'password',
             image: open('app/assets/images/user_image/business_man_macho.png'),
             self_introduction: 'ハウステンボスやバイオパークなど、
  長崎県の観光地に行ったらぜひ足を運んでいただきたいカフェを共有いたします',
             activated: true,
             activated_at: Time.zone.now)

User.create!(name: '青森 大輔',
             email: 'aomori@example.com',
             password: 'password',
             password_confirmation: 'password',
             image: open('app/assets/images/user_image/business_man_macho.png'),
             self_introduction: 'いま、青森に住んでいます。
  このアプリを通じていろんな地域のカフェを知りたいです。',
             activated: true,
             activated_at: Time.zone.now)

User.create!(name: 'はしもと 東京',
             email: 'tokyo@example.com',
             password: 'password',
             password_confirmation: 'password',
             image: open('app/assets/images/user_image/business_man_macho.png'),
             self_introduction: '都会でしか味わえないコーヒーが飲める場所を投稿します。',
             activated: true,
             activated_at: Time.zone.now)

User.create!(name: 'レン 愛知',
             email: 'aichi@example.com',
             password: 'password',
             password_confirmation: 'password',
             image: open('app/assets/images/user_image/business_man_macho.png'),
             self_introduction: '愛知県の有名なカフェをご紹介します。
  愛知に来たら、ぜひ寄ってみてください！',
             activated: true,
             activated_at: Time.zone.now)

User.create!(name: '秋田 ケンジ',
             email: 'akita@example.com',
             password: 'password',
             password_confirmation: 'password',
             image: open('app/assets/images/user_image/business_man_macho.png'),
             self_introduction: '秋田県にきたら絶対に行って欲しいカフェを紹介します！',
             activated: true,
             activated_at: Time.zone.now)

User.create!(name: '神奈川　ジン',
             email: 'kanagawa@example.com',
             password: 'password',
             password_confirmation: 'password',
             image: open('app/assets/images/user_image/business_man_macho.png'),
             self_introduction: '横浜から小田原まで、神奈川県のオススメなカフェを幅広くご紹介いたします。',
             activated: true,
             activated_at: Time.zone.now)

User.create!(name: 'おおきに　大阪',
             email: 'osaka@example.com',
             password: 'password',
             password_confirmation: 'password',
             image: open('app/assets/images/user_image/business_man_macho.png'),
             self_introduction: '一風変わったコーヒーが飲めるのが大阪！
  おおきにの気持ちで立ち寄ってや',
             activated: true,
             activated_at: Time.zone.now)

User.create!(name: 'ミネラル 沖縄',
             email: 'okinawa@example.com',
             password: 'password',
             password_confirmation: 'password',
             image: open('app/assets/images/user_image/business_man_macho.png'),
             self_introduction: '沖縄ならではのコーヒーが飲めるお店を投稿していきます。',
             activated: true,
             activated_at: Time.zone.now)

User.create!(name: 'すずしや 京都',
             email: 'kyouto@example.com',
             password: 'password',
             password_confirmation: 'password',
             image: open('app/assets/images/user_image/business_man_macho.png'),
             self_introduction: '京都でしか堪能できない風情あるカフェを共有したいと思います。',
             activated: true,
             activated_at: Time.zone.now)

User.create!(name: '静岡 ちゃちゃ',
             email: 'shizuoka@example.com',
             password: 'password',
             password_confirmation: 'password',
             image: open('app/assets/images/user_image/business_man_macho.png'),
             self_introduction: 'お茶がテーマのカフェが何軒かあるので投稿で共有したいと思います〜',
             activated: true,
             activated_at: Time.zone.now)

User.create!(name: 'クレヨン 埼玉',
             email: 'saitama@example.com',
             password: 'password',
             password_confirmation: 'password',
             image: open('app/assets/images/user_image/business_man_macho.png'),
             self_introduction: '埼玉に観光にきたら絶対立ち寄って欲しいカフェがあります。
春日部防衛隊ファイアー！',
             activated: true,
             activated_at: Time.zone.now)

User.create!(name: '和歌山 オレンジ',
             email: 'wakayama@example.com',
             password: 'password',
             password_confirmation: 'password',
             image: open('app/assets/images/user_image/business_man_macho.png'),
             self_introduction: 'みかんが大好きです。カフェは２番目に大好き。。',
             activated: true,
             activated_at: Time.zone.now)

User.create!(name: '鳥取 さきゅー',
             email: 'tottori@example.com',
             password: 'password',
             password_confirmation: 'password',
             image: open('app/assets/images/user_image/business_man_macho.png'),
             self_introduction: 'カフェもいいけど砂丘もね。',
             activated: true,
             activated_at: Time.zone.now)

User.create!(name: 'カープ 広島',
             email: 'hirosima@example.com',
             password: 'password',
             password_confirmation: 'password',
             image: open('app/assets/images/user_image/business_man_macho.png'),
             self_introduction: 'カープ！カープ！広島カープ！
広島オススメのカフェをお伝えします！',
             activated: true,
             activated_at: Time.zone.now)

Post.create!(
  address: '愛知県名古屋市中区大須3-31−11',
  image: open('app/assets/images/cafe_shop/cafe(1).jpeg'),
  time_start: '7:30',
  time_end: '20:00',
  user_id: '1',
  store_name: 'ドトールコーヒーショップ 大須万松寺通店'
)

Post.create!(
  address: '北海道札幌市南区定山渓567−36',
  image: open('app/assets/images/cafe_shop/cafe(2).jpeg'),
  time_start: '7:30',
  time_end: '20:00',
  user_id: '2',
  store_name: 'カフェ崖の上'
)

Post.create!(
  address: '北海道勇払郡厚真町字豊沢495−4',
  image: open('app/assets/images/cafe_shop/cafe(2).jpeg'),
  time_start: '11:00',
  time_end: '17:00',
  user_id: '2',
  store_name: 'momo・cafe'
)

Post.create!(
  address: '北海道札幌市中央区南2-26-2-18',
  image: open('app/assets/images/cafe_shop/cafe(2).jpeg'),
  time_start: '10:00',
  time_end: '21:00',
  user_id: '2',
  store_name: '森彦'
)

Post.create!(
  address: '長崎県長崎市東古川町１−５',
  image: open('app/assets/images/cafe_shop/cafe(3).jpeg'),
  time_start: '11:30',
  time_end: '19:00',
  user_id: '3',
  store_name: '長崎カフェ 一花五葉'
)

Post.create!(
  address: '長崎県長崎市出島町10−3',
  image: open('app/assets/images/cafe_shop/cafe(3).jpeg'),
  time_start: '11:00',
  time_end: '17:00',
  user_id: '3',
  store_name: 'cafe わかば堂 長崎出島店'
)

Post.create!(
  address: '長崎県長崎市万屋町5−9',
  image: open('app/assets/images/cafe_shop/cafe(3).jpeg'),
  time_start: '12:00',
  time_end: '19:00',
  user_id: '3',
  store_name: 'ディコ・アパルトマン'
)

Post.create!(
  address: '青森県青森市長島2-5−20',
  image: open('app/assets/images/cafe_shop/cafe(4).jpeg'),
  time_start: '12:00',
  time_end: '17:00',
  user_id: '4',
  store_name: 'アヲモリカフェ'
)

Post.create!(
  address: '東京都新宿区新宿3-31−3',
  image: open('app/assets/images/cafe_shop/cafe(5).jpeg'),
  time_start: '9:30',
  time_end: '23:00',
  user_id: '5',
  store_name: '名曲・珈琲 らんぶる'
)

users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
