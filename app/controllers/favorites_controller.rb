class FavoritesController < ApplicationController
 before_action :authenticate_user!

  def create
    book = Book.find(params[:book_id])
    favorite = book.favorites.new(user_id:current_user.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    book = Book.find(params[:book_id])
    favorite = book.favorites.find_by(user_id:current_user.id)
    favorite.destroy
    redirect_to request.referer
  end
<<<<<<< HEAD
end
=======

end
>>>>>>> 8c9886d0fc2ff2c2a3b1084824cc18a5a29ebe2f
