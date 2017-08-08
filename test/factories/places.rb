# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :place do
    title "MyString"
    address "MyText"
    latitude 1.5
    longitude 1.5
    visited_by "MyString"
  end
end
