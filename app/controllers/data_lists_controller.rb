class DataListsController < ApplicationController
	def show
		@dl = DataList.find(params[:id])
	end
end
