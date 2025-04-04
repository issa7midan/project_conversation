class CommentsController < ApplicationController
  load_and_authorize_resource :project
  load_and_authorize_resource :comment, through: :project

  def create
    if @comment.save
      redirect_to @project, notice: 'Comment added!'
    else
      render 'projects/show'
    end
  end

  private

  def comment_params
    params.permit(:body).merge(user_id: current_user.id, project_id: @project.id)
  end
end
