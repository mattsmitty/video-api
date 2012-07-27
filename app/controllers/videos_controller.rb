class VideosController < ApplicationController

  def index
    app = App.find(params[:app_id])
    category = app.categories.find(params[:category_id])
    @videos = category.videos
  end


  def show
    @video = Video.find(params[:id])
  end
end