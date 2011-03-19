#coding=utf-8
class DataFormsController < ApplicationController
  def index
  	@data_forms = DataForm.all(:order => "created_at DESC").paginate(:page=>params[:page]||1,:per_page=>20)
  end

  def new
  	@data_form = DataForm.new
    @data_form.data_lists.build
    @type = params[:type]
  end

  def create
  	@data_form = DataForm.new(params[:data_form])
  	if @data_form.save
  		redirect_to data_forms_path
  	else
     @data_form.data_lists.build
  		render :new
  	end
  end

  def show
    @data_form = DataForm.find(params[:id])
  end

  def destroy
    data_form = DataForm.find(params[:id])
    data_form.destroy

    redirect_to data_forms_path
  end

end
