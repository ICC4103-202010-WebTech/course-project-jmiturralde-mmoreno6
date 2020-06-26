class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      url = request.referrer
      if url.nil?
        url ||= root_path
      end
      if exception.subject.class.name == 'Organization'
        format.html { redirect_to url, alert: 'You are not part of this Organization' }
      else
        format.html { redirect_to url, alert: exception.message }
      end
    end
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :terms, profile_page_attributes: [:name,
                                                                                             :last_name,
                                                                                            :location]])
  end

  def authenticate_admin!
    authenticate_user!
    unless current_user.system_admin?
      redirect_to root_path, alert: "You don't have admin permissions."
    end
  end
end
