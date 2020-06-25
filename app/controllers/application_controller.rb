class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  load_and_authorize_resource :user
  load_and_authorize_resource :event
  load_and_authorize_resource :event_invitation
  load_and_authorize_resource :organization
  load_and_authorize_resource :organization_invitation

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html { redirect_to root_path, alert: exception.message }
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
