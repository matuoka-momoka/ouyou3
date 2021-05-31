class UsersController < ApplicationController
 def show
  @user = User.find(params[:id])
  # @book = @user.book.page(params[:page]).reverse_order
  @book = Book.new
  @books = @user.books
 end

 def index
  @user = current_user
  @booknew = Book.new
  @users = User.all
 end

 def edit
  @user = User.find(params[:id])
   if @user.id == current_user.id
    render :edit
   else
    redirect_to user_path(current_user.id)
   end
 end

 def update
     @user = User.find(params[:id])
   if @user.update(user_params)
         flash[:notice] = "You have created book successfully."
         redirect_to user_path(@user)
   else
       render:edit
   end
 end

  def change
  add_index :users, :email, unique: true
  end

   private
   # ストロングパラメータ
   def user_params
     params.require(:user).permit(:name,:introduction,:profile_image)
   end

end