class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.erros.full_messages
      render :new
    end
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      redirect_to new_user_url
    else
      flash.now[:errors] = 'user was unable to be destroyed'
      redirect_to new_user_url
    end
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
