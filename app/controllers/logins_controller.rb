#coding=utf-8
class LoginsController < ApplicationController
  skip_before_filter :require_login, :only => [:new, :create]

  def new  	
  end

  def create
  	if authericate(params[:user][:password])
  		redirect_to root_path
  	else
  		flash[:error] = "密码错误"
  		render :new
  	end
  end

  def destroy
  	session[:current_user_id]  = nil
  	redirect_to root_path
  end

private
  def authericate(password)
  	if password.eql? "3666319" 	
	  	session[:current_user_id] ="user" 
  	elsif password.eql? "9136663" 
	  	session[:current_user_id] ="admin"
  	end
  end

end
