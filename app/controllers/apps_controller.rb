class AppsController < ApplicationController

  def show
    @app = App.find_by_name(params[:name])
  end



end