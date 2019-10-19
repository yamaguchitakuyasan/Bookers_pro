class UsersController < ApplicationController

    def index
         @users = User.all
         @book = Book.new
    end

	def show
		@book = Book.new
		@user = User.find(params[:id])
		@books = current_user.books
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to user_path
    end

    private
    def user_params
    params.require(:user).permit(:name, :profile_image)
    end

end