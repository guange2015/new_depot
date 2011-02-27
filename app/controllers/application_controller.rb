class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :require_login

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
