require 'faker'

FactoryGirl.define do
  factory :skill do |f|
    f.title 'Ruby on Rails'
    f.level 5
    f.description 'I sometimes write tests.'
    f.rank 1
    f.skill_type 'Programming'
  end
end
