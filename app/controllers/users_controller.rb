class UsersController < ApplicationController

	def show
		@book = Book.new
		@user = User.find(params[:id])
		@books = @user.books
    end

    private
    def user_params
    params.require(:user).permit(:name)
    end

end