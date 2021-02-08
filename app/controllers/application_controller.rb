class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user,
                :current_user?,
                :current_admin?,
                :require_admin,
                :require_not_admin,
                :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_user?
    current_user && current_user.user?
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def require_admin
    render file: "/public/404" unless current_admin?
  end

  def require_not_admin
    render file: "/public/404" if current_admin?
  end

  def logged_in?
    session[:user_id].present?
  end
end
