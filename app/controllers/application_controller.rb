class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale, only: :create

  def set_locale
    I18n.locale = current_user.locale || I18n.default_locale
  end
end
