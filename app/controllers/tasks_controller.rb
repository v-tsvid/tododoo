class TasksController < ApplicationController
  def index
    @tasks = Task.where(project_id: params[:project_id])
  end

  def show
    @task = Task.find_by_id(params[:id])
  end

  def create
    @task = Task.new(params.require(:task).permit(:title, :project_id))
    @task.save
    render 'show', status: 201
  end

  def update
    @task = Task.find(params[:id])
    @task.update_attributes(params.require(:task).permit(:title))
    head :no_content
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    head :no_content
  end
end
