class SessionsController < ApplicationController

  def new; end

  def create
    user = User.find_by(email: params[:email])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.name}!"
      redirect_by_role
    else
      flash[:error] = "Sorry, your credentials are bad."
      render :new
    end
  end

end
