class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?
#devise利用の機能（ユーザ登録、ログイン認証など）が使われる場合、その前にconfigure_permitted_parametersが実行されます。

  protected
#基本的に外部からは隠蔽するが、サブクラスやパッケージ内からのみ利用させたい場合は protected 。 基本的に外部からは隠蔽し、クラス内からのみ利用させたい場合は private 。 という使い分けになっていて、かなり分かりやすく、使い分ける目的も明確です。

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
#8~10行目でnameのデータ操作を許可するアクションメソッドが指定
#sign upに名前の項目を追加下から記入した。
#-------------------------------------------------------------------devise遷移先
  def after_sign_in_path_for(resource)
    users_home_path
  end
end
