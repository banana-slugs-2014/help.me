FactoryGirl.define do
  factory :user do
    uid {Faker::Number.number(10)}
    oauth_token "1234567890asdfghjkl"
    name {Faker::Name.name}
    recent_longitude {Faker::Address.longitude}
    recent_latitude {Faker::Address.latitude}
  end

  factory :user_attribs, class: User do
    userID {Faker::Number.number(10)}
    accessToken "1234567890asdfghjkl"
  end

  factory :place do
    name {Faker::Name.name}
    address {Faker::Address.city}
    types ["food", "otherfood"]
    latitude 123
    longitude 122
  end

  factory :checkin do
    city {Faker::Address.city}
    country "United States"
    longitude "-118.27486969698"
    latitude "34.075289113061"
    name {Faker::Name.name}
    user
  end

  factory :user_like do
    category {Faker::Address.name}
    name {Faker::Name.name}
    user
  end

  factory :recommendation_place, class: Place do
    name "Test"
    address "123 Fake Avenue"
    types ["food", "otherfood"]
    latitude 123
    longitude 122
  end

  factory :recommendation do
    association :place, factory: :recommendation_place
    user
    recommendation_strategy
    like true
  end

  factory :recommendation_strategy do
    type 'RecommendableStrategy'
  end

  factory :quirky, class: SimpleQuirkyPlaces do
  end

  factory :facebook_weighted, class: FacebookWeighted do
  end

  factory :foursquare, class: SimpleFourSquare do
  end

  factory :awesome_facebook, class: AwesomeFacebook do
  end

  factory :namesake, class: FacebookFirstnamePlaces do
  end

  factory :recommendable_strategy, class: RecommendableStrategy do
  end

  factory :simple_four_square do
  end

end