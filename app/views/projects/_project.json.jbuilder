json.(project, :id, :title)
json.tasks project.tasks, partial: 'project_task', as: :task