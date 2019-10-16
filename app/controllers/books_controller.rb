class BooksController < ApplicationController

    def show
    	@book = Book.find(params[:id])
        @user = User.find(params[:id])
    end

	def create
    	@book = Book.new(book_params)
    	@book.save
    	redirect_to book_path(@book.id)
    end

    private
    def book_params
      params.require(:book).permit(:title, :body)
    end

end