class UsersController <ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:show]

  def new
    @user = User.new
  end

  def create

    @user=User.new(user_params)

    if @user.save
      redirect_to user_path(@user)
      session[:user_id]=@user.id
    else
      render :new
    end
  end

  def show
    if current_user.admin
      render 'admin_show'
    else
      render 'show'
    end
  end



  private
  def user_params
    params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets,:admin)
  end
  def require_login
    redirect_to '/' unless session.include? :user_id
  end
  def require_admin


  end
  def set_user
    @user=User.find(params[:id])
  end
end
