# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :current_user

  #ログインしているユーザー情報を取得。
  # もし、session[:user_id]がnillであればreturn
  # session[:user_id]がtrueであれば、ユーザー情報を@current_userに代入
  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

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

  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile, :image])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:image])
    devise_parameter_sanitizer.permit(:edit, keys: [:image])
  end

end
