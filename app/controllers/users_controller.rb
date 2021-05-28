class UsersController < ApplicationController
 def show
  @user = current_user
  # @book = @user.book.page(params[:page]).reverse_order
  @book = Book.new

 end

def index
 @user = current_user
 @booknew = Book.new


end

def edit
 @book = current_user

end

def update
    @book = Book.find(params[:id])
  if @book.update(book_params)
        flash[:notice] = "You have created book successfully."
        redirect_to :book

  else
      render:edit
  end
end

  private
  # ストロングパラメータ
  def user_params
    params.permit(:title, :body)
  end


end