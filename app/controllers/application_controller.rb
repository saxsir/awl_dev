class ApplicationController < ActionController::Base

#以下、
#https://github.com/plataformatec/devise/wiki/How-To:-Redirect-to-a-specific-page-on-successful-sign-in
#を参考にして、
#「どこかのページからログインやサインアップに飛ばされたとき、
# ログイン終了時にもとのページに戻る」の実装をここで行う

  protect_from_forgery

  def after_sign_in_path_for(resource)
    sign_in_url = url_for(:action => 'new', :controller => 'sessions', :only_path => false, :protocol => 'http')
    sign_up_url = url_for(:action => 'new', :controller => 'registrations', :only_path => false, :protocol => 'http')
    if request.referer == sign_in_url || sign_up_url
      super
    else
      stored_location_for(resource) || request.referer || root_path
    end
  end

end
