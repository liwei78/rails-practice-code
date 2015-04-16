class HomeController < ApplicationController
  def index
    @name = params[:name]
    @like = params[:like]
  end
end
