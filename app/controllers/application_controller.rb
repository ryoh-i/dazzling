# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # ログイン後のリダイレクト先変更のため、devise/controllers/helpers.rbに定義してあるメソッドをオーバーライド
  def after_sign_in_path_for(_resource_or_scope)
    posts_path
  end

  # ログアウト後のリダイレクト先変更のため、devise/controllers/helpers.rbに定義してあるメソッドをオーバーライド
  def after_sign_out_path_for(_resource_or_scope)
    root_path
  end

  # アカウント新規作成後のリダイレクト先変更のため、devise/controllers/helpers.rbに定義してあるメソッドをオーバーライド
  def after_inactive_sign_up_path_for(_resource)
    posts_path
  end

  # Get /users/guest_sign_in
  # ゲストログイン機能時のアクション
  def new_guest
    user = User.find_or_create_by!(name: 'ゲスト様', email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
    sign_in user
    flash[:notice] = 'ゲストとしてログインされました'
    redirect_to posts_path
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name profile image])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:image])
    devise_parameter_sanitizer.permit(:edit, keys: [:image])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name profile])
  end
end
