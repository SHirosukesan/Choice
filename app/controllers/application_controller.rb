class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?
#devise利用の機能（ユーザ登録、ログイン認証など）が使われる場合、その前にconfigure_permitted_parametersが実行されます。
# ログインしてなかったらログイン画面に返す（URL直打ちも不可。deviseのメソッド。homesコントローラーのみスキップ記述。）
#except: [:top]でtopページのみ閲覧可能にする。
 before_action :authenticate_user!, except: [:top,:new_guest]
  protected
#基本的に外部からは隠蔽するが、サブクラスやパッケージ内からのみ利用させたい場合は protected 。 基本的に外部からは隠蔽し、クラス内からのみ利用させたい場合は private 。 という使い分けになっていて、かなり分かりやすく、使い分ける目的も明確です。

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
#8~10行目でnameのデータ操作を許可するアクションメソッドが指定
#sign upに名前の項目を追加下から記入した。
#-------------------------------------------------------------------devise遷移先
  def after_sign_in_path_for(resource)
    public_shops_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end
end
