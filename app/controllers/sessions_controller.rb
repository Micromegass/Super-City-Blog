class SessionsController < ApplicationController
  before_action :private_access, only: [:destroy]
  before_action :public_access, except: [:destroy]

  def create
    user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        sign_in(user)
        flash[:success] = "Bienvenido pana! Entraste exitosamente"
        redirect_to root_path
      else
        flash.now.alert = "Tu email y/o contraseña son inválidas. Intenta nuevamente."
        render :new
      end
  end

  def destroy  
    sign_out
    flash[:warning] = "Hasta Luego, para que vuelvas pronto..."
    redirect_to root_path
  end 
end
