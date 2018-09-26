class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]


  def index
    @users = User.all
    @user = User.find(current_user[:id])
    @bookf = Book.new
  end

  def show
  	@user = User.find(params[:id])
  	@bookf = Book.new
  	@books = @user.book.all
  end

  def edit
    @user = User.find(params[:id])
  end


  def update
  	@user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id), notice:"User was successfuly Updated"
  else
   render :edit
    end
 end


  def correct_user
    @user = current_user
    unless @user
      redirect_to root_path
    end
  end


private
    def user_params
    	params.require(:user).permit(:name, :introduction, :photo)
    end
    def book_params
      params.require(:book).permit(:title, :body,:user_id)
    end

end
