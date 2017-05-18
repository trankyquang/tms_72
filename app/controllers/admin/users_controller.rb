class Admin::UsersController < ApplicationController

  layout "admin_application"
  before_action :load_admin_user, except: [:index, :new, :create]
  load_and_authorize_resource

  def index
    @admin_users = User.search_by_name_and_email(params[:search]).
      order_by_created_at.page(params[:page]).
      per Settings.paginate.users_per_page
  end

  def show
  end

  def new
    @admin_user = User.new
  end

  def edit
  end

  def create
    @admin_user = User.new admin_user_params
    if @admin_user.save
      flash[:success] = t "user_create_success"
      redirect_to admin_user_path @admin_user
    else
      render :new
    end
  end

  def update
    if @admin_user.update admin_user_params
      flash[:success] = t "user_update_success"
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def destroy
    if @admin_user.destroy
      flash[:success] = t "user_deleted_success"
    else
      flash[:danger] = t "user_deleted_unsuccess"
    end
    redirect_to admin_users_path
  end

  private
  def load_admin_user
    @admin_user = User.find_by id: params[:id]
    render :error unless @admin_user.present?
  end

  def admin_user_params
    params.require(:user).permit :name, :email, :avatar_url, :password,
      :password_confirmation, :role
  end
end
