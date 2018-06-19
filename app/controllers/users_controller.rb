class UsersController < ApplicationController


    def new 
      @user = User.new
    end 

    def create
        @user = User.new(user_params)
         if @user.save
          session[:user_id] = @user.id
          flash[:success] = "Bacano! Creaste una Cuenta! Ahora puedes compartir con la communidad..."
          redirect_to posts_path
      else
        render :new
      end
    end

private
  def user_params
    params.require(:user).permit(:email, :password, :name, :username)
  end
    

end
