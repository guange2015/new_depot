#coding=utf-8

class  CategoriesController < ApplicationController
  
  def index
    @categories = Category.categories
  end

  def show
  end

  def update
    begin
      pk = params[:pk] || params[:id]
      cate = Category.find(pk)
      cate.name = params[:value]
      cate.save!
      render :text => cate.name, :status => 200
    rescue Exception=>e
      render :json => {status: 'error', msg: e.message}
    end
  end

  def resort
    cate = Category.find(params[:id])
    cate.resort params[:nodes]
    render :text => 'success'
  end

  def destroy
    cate = Category.find(params[:id])
    cate.destroy if cate.fireworks.empty?
  end

end
