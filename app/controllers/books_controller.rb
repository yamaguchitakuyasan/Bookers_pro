class BooksController < ApplicationController

	def create
    	book = Book.new(book_params)
    	book.save
    	redirect_to show_book_path(@book.id)
    end

    private
    def book_params
      params.require(:book).permit(:title, :body)
    end

end
