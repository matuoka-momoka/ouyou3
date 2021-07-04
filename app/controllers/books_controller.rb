class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  # 投稿データの保存
  def create
    @user = current_user
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    #@user= user.find(params[:id])
    if @book.save
       flash[:notice] = "You have created book successfully."
       redirect_to book_path(@book)
    else
     @user = current_user
     @books = Book.all
      render:index
    end
  end

def edit
 @book = Book.find(params[:id])
  if @book.user == current_user
   render "edit"
  else
   redirect_to books_path
  end
end

  def index
    @book = Book.new
    @user = current_user
    @books = Book.all
  end

  def show
    #book =book.update(book_params)
    #book.save
    #redirect_to '/top'
    @book = Book.find(params[:id])
    @book_new = Book.new
    @book_comment = BookComment.new
    @book_comments = @book.book_comments
    #@username = User.find(session[:user_id])
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
        redirect_to book_path(@book)
    else
      render:edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

   # 投稿データのストロングパラメータ
  private
  def book_params
    params.require(:book).permit(:title, :body)#.merge(user_id: current_user.id)
  end

end