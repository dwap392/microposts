class UsersController < ApplicationController
  before_action :set_user, only:[:edit, :update]
  before_action :auth_user, only:[:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc)
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Samle App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to root_path , notice: 'プロフィールを編集しました'
    else
      render 'edit'
    end
  end

  def followings
    @user = User.find(params[:id])
    @followings = @user.following_users.order(id: :desc)
  end
  
  def followers
    @user = User.find(params[:id])
    @followers = @user.follower_users.order(id: :desc)
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :location)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  def auth_user
    if @user != current_user
      redirect_to root_url, flash: { danger: "自分のアカウントのみ編集できます"}
    end
  end
end
