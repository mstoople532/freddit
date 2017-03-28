class CommentsController < ApplicationController
  def index
    @comment = Comment.new
    @comments = Comment.where(submission_id: params[:submission_id]).order(comment_time: :desc)
    @submission = Submission.find(params[:submission_id])
  end

  def create
    time = { comment_time: Time.now }
    params = comment_params.merge(time)
    @comment = Comment.create(params)
    redirect_to "/"
  end

  private def comment_params
    params.require(:comment).permit(:comment_text, :submission_id)
  end
end
