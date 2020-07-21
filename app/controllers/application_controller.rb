class ApplicationController < ActionController::Base

  #ログイン後のリダイレクト先変更のため、devise/controllers/helpers.rbに定義してあるメソッドをオーバーライド
  def after_sign_in_path_for(resource_or_scope)
    posts_path
  end

  #ログアウト後のリダイレクト先変更のため、devise/controllers/helpers.rbに定義してあるメソッドをオーバーライド
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  #アカウント新規作成後のリダイレクト先変更のため、devise/controllers/helpers.rbに定義してあるメソッドをオーバーライド
  def after_inactive_sign_up_path_for(resource)
    posts_path
  end
end