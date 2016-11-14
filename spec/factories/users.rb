FactoryGirl.define do
  factory :user do
    email                 { Faker::Internet.email }
    password              { 'password' }
    password_confirmation { 'password' }

    factory :user_with_projects_tasks_comments do
      transient do
        projects_count { rand(1..10) }
      end
      after(:create) do |user, evaluator|
        create_list(:project_with_tasks_comments, evaluator.projects_count, user: user)
      end
    end
  end
end
