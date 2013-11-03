#coding=utf-8

class  CategoriesController < ApplicationController
  
  def index
    @categories = Category.categories
  end

  def show
  end

  def update
    begin
      pk = params[:pk]
      cate = Category.find(pk)
      cate.name = params[:value]
      cate.save!
      render json: {status: 'success'}
    rescue Exception=>e
      render json: {status: 'error', msg: e.message}
    end
  end

end
