class SubmissionsController < ApplicationController
  before_action :authorize!, except: [:index]
  def index
    @submissions = Submission.all.order(submission_time: :desc)
    @comments = Comment.all
  end

  def new
    @submission = Submission.new
  end

  def create
    extra_params = { submission_time: Time.now, user_id: current_user.id }
    params = submission_params.merge(extra_params)
    @submission = Submission.new(params)

    if @submission.save!
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

  private def authorize!
    unless current_user
      session[:error] = "Please log in"
      redirect_to new_sessions_path
    end
  end
end
