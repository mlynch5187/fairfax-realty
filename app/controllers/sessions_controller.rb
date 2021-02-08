class SessionsController < ApplicationController

  def new
    if logged_in?
      flash[:error] = "I'm already logged in"
      redirect_by_role
    end
  end

  def create
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.email}!"
      redirect_by_role
    else
      flash[:error] = "Sorry, your credentials are bad."
      render :new
    end
  end

  private

  def redirect_by_role
    redirect_to '/admin/dashboard' if current_admin?
  end
end
