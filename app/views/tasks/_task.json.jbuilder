json.(task, :id, :project_id, :title, :priority, :deadline, :done?)
json.comments task.comments, partial: 'comments/comment', as: :comment
