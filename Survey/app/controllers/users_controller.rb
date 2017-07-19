class UsersController < ApplicationController
  before_action :set_user ,only: [:show, :edit, :update, :destroy]
  def editownprofile
    @user = User.find(session[:user_id])
  end
  def new
    @user=User.new
  end
  def index
    @users = User.all
  end
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to '/users', notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to questions_url }
      format.json { head :no_content }
    end
  end



  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

private


    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
      
    end


  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
