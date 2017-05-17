class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_user_parameters, if: :devise_controller?
  rescue_from CanCan::AccessDenied do |exception|
    render file: "public/404.html", status: 404, layout: false
  end

  protected

  def configure_user_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit :name, :email, :password, :password_confirmation,
        :avatar_url
    end
    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit :name, :email, :password, :password_confirmation,
        :current_password, :avatar_url
    end
  end

  def verify_admin
    if current_user.trainee?
      flash[:danger] = t "permission_denied"
      redirect_to root_url
    end
  end
end
