class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?

  protected
#基本的に外部からは隠蔽するが、サブクラスやパッケージ内からのみ利用させたい場合は protected 。 基本的に外部からは隠蔽し、クラス内からのみ利用させたい場合は private 。 という使い分けになっていて、かなり分かりやすく、使い分ける目的も明確です。

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
#sign upに名前の項目を追加下から記入した。
end
