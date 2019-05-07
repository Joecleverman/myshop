class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "You are not allowed to access this page."
    redirect_to root_path
  end

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_path
  end
  
end