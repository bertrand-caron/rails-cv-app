require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.email { Faker::Internet.email }
    f.name { Faker::Name.first_name }
    f.password "foobar"
    f.password_confirmation "foobar"

  factory :invalid_user, :parent => :user do |f|
    f.name nil
  end
  end
end
