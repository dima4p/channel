class ApplicationController < ActionController::Base

  helper :layout
  include AuthenticationHelper

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = t :access_denied
    store_target_location
    if current_user.new_record?
      redirect_to login_url
    else
      redirect_to user_path(id: current_user.id)
    end
  end

  def self.default_url_options(options = {})
    options.merge(locale: I18n.locale)
  end

  protected

  def current_ability
    @current_ability ||= Ability.new current_user
  end

  private

  def require_no_user
    if logged_in?
      flash[:notice] = t :no_login_to_acces
      redirect_to root_url
      return false
    end
  end

end
