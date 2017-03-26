class SubmissionsController < ApplicationController
  def index
    @submissions = Submission.all.order(submission_time: :desc)
    @comments = Comment.all
  end

  def new
    @submission = Submission.new
  end

  def create
    time = { submission_time: Time.now }
    params = submission_params.merge(time)
    @submission = Submission.new(params)

    if @submission.save
      session[:success] = "Link submitted!"
      redirect_to submissions_path
    else
      session[:error] = "Link could not be submitted, please fill out all required fields"
      render "new"
    end
  end

  private def submission_params
    params.require(:submission).permit(:link, :title)
  end
end
