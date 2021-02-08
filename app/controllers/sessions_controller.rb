class SessionsController < ApplicationController

  def new
    if logged_in?
      redirect_by_role
      flash[:error] = "You're already logged in"
    end
  end

  def create
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.email}!"
      redirect_by_role
    else
      flash[:error] = "Sorry, your credentials are invalid."
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = "Successfully logged out!"
    redirect_to "/"
  end

  private

  def redirect_by_role
    redirect_to '/admin/dashboard' if current_admin?
  end
end
