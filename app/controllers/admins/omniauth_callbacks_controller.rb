class Admins::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    admin = Admin.from_omniauth(request.env.fetch("omniauth.auth"))
    sign_in_and_redirect admin, event: :authentication
  rescue KeyError, ActiveRecord::RecordInvalid
    redirect_to root_path, alert: "Google sign-in could not create your account."
  end

  def failure
    error = request.env["omniauth.error.type"] || "unknown_error"
    Rails.logger.warn("Google OAuth failed: #{error}")
    redirect_to root_path, alert: "Google sign-in failed (#{error})."
  end
end
