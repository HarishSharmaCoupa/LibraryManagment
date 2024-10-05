class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update]

    def new
        @user = User.new
    end

    def show
        @books = @user.books.paginate(page: params[:page], per_page: 5)
    end
    
    def index
        @users = User.all
    end

    def edit
      end
    
      def update
        if @user.update(user_params)
          flash[:notice] = "Your account information was successfully updated"
          redirect_to @user
        else
          render 'edit'
        end
      end

    def create 
        @user = User.create(user_params)
        if @user.save
            flash[:notice] = "User #{@user.username} was registered Succesfully"
            redirect_to @user
        else
            render 'new'
        end
    end

    private
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

    def set_user
        @user = User.find(params[:id])
    end
end