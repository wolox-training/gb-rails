module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def google_oauth2
      @user = User.from_omniauth(request.env['omniauth.auth'])

      if @user.persisted?
        user_persisted
      else
        user_not_persisted
      end
    end

    def user_persisted
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
      sign_in_and_redirect @user, event: :authentication
    end

    def user_not_persisted
      session['devise.google_data'] = request
                                      .env['omniauth.auth'].except(:extra)
      redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
    end
  end
end
