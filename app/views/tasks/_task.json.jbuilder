json.(task, :id, :project_id, :title, :priority, :deadline, :done?)
json.comments task.comments, partial: 'task_comment', as: :comment
