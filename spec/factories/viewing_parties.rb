FactoryBot.define do
  factory :viewing_party do
    duration { rand(0..240) }
    date { Faker::Date.forward(days: rand(1..14)) }
    start_time { Time.new.strftime("%H:%M") }
  end
end
