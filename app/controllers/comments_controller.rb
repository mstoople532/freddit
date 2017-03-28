class CommentsController < ApplicationController
  def index
    @comment = Comment.new
    @comments = Comment.where(submission_id: params[:submission_id]).order(comment_time: :desc)
    @submission = Submission.find(params[:submission_id])
  end

  def create
    extra_params = { comment_time: Time.now, user_id: current_user.id }
    params = comment_params.merge(extra_params)
    @comment = Comment.new(params)
    @comment.save!
    redirect_to "/"
  end

  private def comment_params
    params.require(:comment).permit(:comment_text, :submission_id)
  end
end
