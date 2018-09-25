class BooksController < ApplicationController
before_action :authenticate_user!

  def index
    @user = User.find(current_user[:id])
    @books = Book.all
    @bookf = Book.new
  end

  def create
    @bookf = Book.new(book_params)
    @bookf.user_id = current_user.id
    if @bookf.save
    redirect_to book_path(@bookf.id)
    flash[:notice] = "Book was seccessfully created"
    else
    @user = current_user
    @books = @user.book.all
    render :template => "users/show"
    end
  end

  def show
    @bookf = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book.id), notice:"Book was successfuly Updated"
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path, notice:"Book was successfully destroyed"
  end


    private

    def book_params
      params.require(:book).permit(:title, :body, :user_id)
    end
    def user_params
      params.require(:user).permit(:name, :introduction, :photo)
    end

end


