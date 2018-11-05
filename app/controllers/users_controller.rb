class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  def show
    if logged_in?
     @user = User.find(params[:id])
     else
      flash[:error] = "You must be logged in to access this page"
      redirect_to login_path
    end

    if session[:user_id].to_i != params[:id].to_i
      flash[:error] = "You're not allowed to access this page"
      redirect_to root_path
    end
  end
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "You've successfully signed up, welcome !"
      redirect_to root_path
    else
      flash[:danger] = "Sign-up failed, please try again."
      redirect_to signup_path
    end
  end
  def edit
   @user = User.find(session[:id])
  end
   def update
    @user = User.find(session[:id])
    @user.first_name = 
    redirect_to user_path
   end


  def destroy
    @user.destroy
    flash[:info] = "Account successfully deleted, sorry to see you go."
  end
  
  private
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
