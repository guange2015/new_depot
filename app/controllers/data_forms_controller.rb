#coding=utf-8
class DataFormsController < ApplicationController
  autocomplete :firework, :name, :display_value => :name_spec, :full => true, :extra_data => [:lastdata,:spec]
  add_crumb("库单操作"){|instance| instance.send :data_forms_path}

  def print
    @data_form = DataForm.find(params[:id])
    @data_lists = []
    data_lists = @data_form.data_lists.to_a
    while data_lists.length > 0
      @data_lists << data_lists.shift(9)
    end
    render layout: 'print_base'
  end


  def index
  	@data_forms = DataForm.order("created_at DESC").
  	          page(params[:page]||1).per(20)
  end

  def new
  	@data_form = DataForm.new
    @type = params[:type]
    add_crumb(@type == 'in' ? '入库单' : '出库单')
  end

  def create
  	@data_form = DataForm.new(data_form_params)
  	if @data_form.save
  		redirect_to @data_form
  	else
  		render :new
  	end
  end

  def show
    @data_form = DataForm.find(params[:id])
    @data_list = DataList.new unless @data_form.finished?
    add_crumb(@data_form.comment)
  end

  def destroy
    data_form = DataForm.find(params[:id])
    data_form.destroy

    redirect_to data_forms_path
  end

  private
  def data_form_params
    params.require(:data_form).permit(:comment, :s_type, :state)
  end

end
