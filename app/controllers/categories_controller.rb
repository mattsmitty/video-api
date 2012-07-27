class CategoriesController < ApplicationController

  def index
    app = App.find(params[:app_id])
    @categories = app.categories
  end


  def show
    @category = Category.find(params[:id])
  end
end