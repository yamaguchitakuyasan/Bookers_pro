class BooksController < ApplicationController

    before_action :login_required

    def login_required
    redirect_to new_user_session_path unless current_user
    end

    def index
        @books = Book.all
        @book = Book.new
    end

    def show
        @book = Book.new
    	@books = Book.find(params[:id])
        @user = @books.user
    end

    def edit
        @book = Book.find(params[:id])
        @user = @book.user
    if  @user != current_user
        redirect_to books_path
    end
    end

	def create
    	 @book = Book.new(book_params)
         @book.user_id = current_user.id
    if
        @book.save
    	redirect_to book_path(@book.id)
        flash[:notice] = 'You have creatad book successfully.'
    else
        @books = Book.all
        render :index
    end
    end

    def update
        @book = Book.find(params[:id])
    if  @book.update(book_params)
        flash[:update] = 'You have updated book successfully.'
        redirect_to book_path(@book.id)
    else
        render :edit
    end
    end

    def destroy
        book = Book.find(params[:id])
        book.destroy
        redirect_to books_path
    end

    private
    def book_params
      params.require(:book).permit(:title, :body)
    end

end