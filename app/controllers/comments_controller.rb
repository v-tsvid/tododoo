class CommentsController < ApplicationController
  def index
    @comments = Comment.where(task_id: params[:task_id])
  end

  def show
    @comment = Comment.find_by_id(params[:id])
  end

  def create
    @comment = Comment.new(params.require(:comment).permit(:title, :task_id))
    @comment.save
    render 'show', status: 201
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update_attributes(params.require(:comment).permit(:title))
    head :no_content
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    head :no_content
  end
end
