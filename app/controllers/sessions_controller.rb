class SessionsController < ApplicationController

  def new; end

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
    redirect_to '/admin' if current_admin?
  end
end
