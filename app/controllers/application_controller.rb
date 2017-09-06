class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :set_locale
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def set_locale
    I18n.locale = current_user.try(:locale) || I18n.default_locale
  end

  private

  def user_not_authorized
    render json: { errors: 'User not authorized' }, status: :unauthorized
    redirect_to(request.referer || root_path)
  end
end
