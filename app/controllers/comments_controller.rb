class CommentsController < ApplicationController
  # @Ref: https://www.youtube.com/watch?v=TcltF0KVyrE
  # Ref description: tutorial on how to add comments to a resource

  # skip authenticity token before executing any action
  skip_before_action :verify_authenticity_token

  # before executing any action for this controller authenticate user
  before_action :authenticate_user!

  # create comment action
  def create
    @comment = current_user.comments.new(comment_params)
    if !@comment.save
      flash[:notice] = @comment.errors.full_messages.to_sentence
    end

    # redirect to course module path
    redirect_to course_module_path(params[:course_module_id])
  end

  private

  # params required for creating new comment
  def comment_params
    params
      .require(:comment)
      .permit(:content)
      .merge(course_module_id: params[:course_module_id])
  end
end
