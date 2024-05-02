class BookmarksController < ApplicationController

  def index
    @bookmarks = Bookmark.all
  end

  def new
    @bookmark = Bookmark.new
    @movie = Movie.find(params[:movie_id])
    @list = List.find(params[:list_id])
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @list = List.find(params[:list_id])
    bookmark = Bookmark.new(bookmark_params)
    bookmark.movie = @movie
    bookmark.list = @list
    bookmark.save
    redirect_to bookmarks_url
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to bookmarks_url
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
