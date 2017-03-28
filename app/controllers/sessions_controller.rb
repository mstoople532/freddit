class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params)

    if @user && @user.password == params[:password]
      session[:current_user_id] = @user.id
      redirect_to submissions_path
    else
      redirect_to new_sessions_path
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to new_sessions_path
  end
end
