class ApplicationController < ActionController::Base
  before_action :set_customer

  private

  def set_customer
    @user = User.find(1)
  end
end
