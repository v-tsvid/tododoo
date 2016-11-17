class Task < ActiveRecord::Base
  belongs_to :project
  has_many :comments, dependent: :delete_all
end
