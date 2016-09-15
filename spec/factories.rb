FactoryGirl.define do
  factory :song do
    sequence(:name) { |n| "Where The Streets Have No Name - #{n}" }
    duration 360
    album_title 'Joshua Tree'
  end
end
