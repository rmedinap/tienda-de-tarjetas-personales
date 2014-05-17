class UsersController < ApplicationController
  load_and_authorize_resource
  before_filter :authenticate_user!

  def index
    # authorize! :index, @user, :message => 'No está autorizado para acceder a esa página.'
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    # authorize! :update, @user, :message => 'No está autorizado para acceder a esa página.'
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to users_path, :notice => "Usuario actualizado."
    else
      redirect_to users_path, :alert => "No se puede actualizar el usuario."
    end
  end

  def destroy
    # authorize! :destroy, @user, :message => 'No está autorizado para acceder a esa página.'
    user = User.find(params[:id])
    unless user == current_user
      user.destroy
      redirect_to users_path, :notice => "Usuario eliminado."
    else
      redirect_to users_path, :notice => "Can't delete yourself."
    end
  end

  def user_params
      params.require(:user).permit(:name, :email, :role_ids, :password, :password_confirmation)
  end

end
