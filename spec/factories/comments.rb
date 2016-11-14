FactoryGirl.define do
  factory :comment do
    text { Faker::Hipster.paragraph(rand(1..5)) }
    task
  end
end
