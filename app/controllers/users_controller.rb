class UsersController < ApplicationController

    before_action :login_required

    def login_required
    redirect_to new_user_session_path unless current_user
    end

    def index
         @users = User.all
         @book = Book.new
    end

	def show
		@book = Book.new
		@user = User.find(params[:id])
		@books = @user.books
    end

    def edit
        @user = User.find(params[:id])
        if @user != current_user
            redirect_to user_path(current_user)
        end
    end

    def update
        @user = User.find(params[:id])
    if  @user.update(user_params)
        redirect_to user_path
        flash[:update] = 'You have updated user successfully.'
    else
        render :edit
    end
    end

    private
    def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
    end

end