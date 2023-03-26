class CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token

  before_action :authenticate_user!

  # create comment action
  def create
    @comment = current_user.comments.new(comment_params)
    if !@comment.save
      flash[:notice] = @comment.errors.full_messages.to_sentence
    end

    redirect_to course_module_path(params[:course_module_id])
  end

  private

  def comment_params
    params
      .require(:comment)
      .permit(:content)
      .merge(course_module_id: params[:course_module_id])
  end
end
