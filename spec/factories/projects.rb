FactoryGirl.define do
  factory :project do
    title { Faker::Hipster.sentence }
    user

    factory :project_with_tasks_comments do
      transient do
        tasks_count { rand(1..10) }
      end
      after(:create) do |project, evaluator|
        create_list(:task_with_comments, evaluator.tasks_count, project: project)
      end
    end
  end
end
