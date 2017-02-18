json.id task.id
json.project_id task.project_id
json.title task.title
json.priority task.priority
json.deadline task.deadline
json.done? task.done?

json.comments task.comments, partial: 'comment', as: :comment