class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :require_login

  add_crumb "首页", '/'

  private
  def require_login
    unless logged_in?
      redirect_to new_login_url # halts request cycle
    end
  end

  def logged_in?
    !!current_user
  end

  def current_user
    @_current_user ||= session[:current_user_id]
  end

end
