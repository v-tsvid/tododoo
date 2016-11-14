FactoryGirl.define do
  factory :task do
    title    { Faker::Hipster.sentence }
    priority { rand(1..10) }
    deadline { Faker::Time.between(1.months.ago, 1.months.from_now) }
    done?    { [true, false].sample }
    project

    factory :task_with_comments do
      transient do
        comments_count { rand(1..10) }
      end
      after(:create) do |task, evaluator|
        create_list(:comment, evaluator.comments_count, task: task)
      end
    end
  end
end
