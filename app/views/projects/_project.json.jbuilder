json.(project, :id, :title)
json.tasks project.tasks, partial: 'task', as: :task