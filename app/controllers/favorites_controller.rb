class FavoritesController < ApplicationController

  def create
    @book_favorites = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id: book.id)
    favorite.save
    redirect_to book_path(@book)
  end
  
  def destroy
    @book_favorites = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: book.id)
    favorite.destroy
    redirect_to book_path(@book)
  end

end