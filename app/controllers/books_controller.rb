class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  # 投稿データの保存
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    #@user= user.find(params[:id])
    if @book.save
      redirect_to book_path(@book)
    else
      render:index
    end
  end

def edit
　@book = User.find(params[:id])
end

  def index
    @book = Book.new
    @user = current_user
    @username = User.find(session[:user_id])

  end

  def show
    #book =book.update(book_params)
    #book.save
    #redirect_to '/top'
    @user = current_user
    @booknew = Book.new
    @book = Book.find(params[:id])
    @username = User.find(session[:user_id])
  end

   #private
  # ストロングパラメータ
  #def book_params
   # params.require(:list).permit(:title, :body)
  #end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
        flash[:notice] = "You have created book successfully."
        redirect_to :book
    else
      render:edit
    end
  end

  def destroy
  end

   # 投稿データのストロングパラメータ
  private
  def book_params
    params.require(:book).permit(:title, :body)#.merge(user_id: current_user.id)
  end

end