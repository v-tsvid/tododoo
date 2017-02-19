class ProjectsController < ApplicationController
  def index
    @projects = current_user ? Project.where(user: current_user) : nil
  end

  def show
    @project = Project.find_by_id(params[:id])
  end

  def create
    @project = Project.new(params.require(:project).permit(:title, :user_id))
    @project.save
    render 'show', status: 201
  end

  def update
    @project = Project.find(params[:id])
    @project.update_attributes(params.require(:project).permit(:title))
    head :no_content
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    head :no_content
  end
end
