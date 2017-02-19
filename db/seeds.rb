require 'database_cleaner'

DatabaseCleaner.clean_with(:truncation)

@user = FactoryGirl.create :user_with_projects_tasks_comments, 
  email: 'mail@mail.com', password: '12345678'
@users = FactoryGirl.create_list :user_with_projects_tasks_comments, 4