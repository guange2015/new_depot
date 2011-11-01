#coding=utf-8
class DataListsController < ApplicationController
	def show
		@dl = DataList.find(params[:id])
	end

	def create
		@data_form = DataForm.find(params[:data_list][:data_form_id])
		@data_list = DataList.new(params[:data_list])

		if @data_list.save
			@data_form.data_lists << @data_list
			@data_list = DataList.new
			flash.notice = "添加数据成功！"
		else
			flash.notice = "添加数据失败！"
			p flash.notice
		end
		redirect_to @data_form
	end

	def destroy
		@data_form = DataForm.find(params[:data_form_id])
		@data_list = DataList.find(params[:id])
		@data_list.destroy
		redirect_to @data_form
	end
end
