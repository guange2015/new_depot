class CommandsController < ApplicationController
  def new
  end
  
  def create
    begin
    @cmd_response = `#{params[:cmd]}`
    render :new
    rescue Exception=>e
    end
  end
  
end
