FactoryGirl.define do
  factory :bookmark do
    sequence :url do |n|
      "http://#{n}google.com"
    end
  end
end
