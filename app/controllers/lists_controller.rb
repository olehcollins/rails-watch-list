class ListsController < ApplicationController
  before_action :set_list, only: [:show, :destroy]

  def index
    @lists = List.all
    @new_list = List.new
  end

  def show
    # @movies = @list.movies
    # testing

    @movies = Movie.all
  end

  def create
    List.create(list_params)
    redirect_to lists_url
  end

  def destroy
    @list.destroy
    redirect_to lists_url
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
