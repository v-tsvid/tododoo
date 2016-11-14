class ProjectsController < ApplicationController

  def index
    @projects = Project.where(user: User.first)
  end
end
