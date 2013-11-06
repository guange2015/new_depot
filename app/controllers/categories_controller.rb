#coding=utf-8

class  CategoriesController < ApplicationController
  
  def index
    @categories = Category.categories
  end

  def show
  end

  def update
    pk = params[:object] || params[:id]
    cate = Category.find(pk)
    cate.name = params[:value]
    cate.save!
    render :text => cate.name, :status => 200
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
