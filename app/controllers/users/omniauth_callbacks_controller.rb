class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    callback(:facebook)
  end

  def callback(provider)
    # プロバイダから認証された情報がrequest.env["omniauth.auth"]として返ってくる
    oauth = request.env["omniauth.auth"]

    # Userテーブルに登録済みではないemailかどうか判定
    if User.where(email: oauth[:info][:email]).blank?
      @user = User.create_oauth(request.env["omniauth.auth"])
      if @user.persisted?
        sign_in_and_redirect @user, event: :authentication
        set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
      else
        # 新規登録用にセッションに情報を格納
        session["device.#{provider}_data"] = oauth
        redirect_to new_user_registration_url
      end
    else
      # Userテーブルにアドレスが登録済みの場合
      snscredential = SnsCredential.find_sns(oauth)
      @user = SnsCredential.check_sns(snscredential, oauth)
      bypass_sign_in(@user)
      redirect_to root_path notice: 'ログインしました'
    end

    def failure
      redirect_to users_index_path
    end
  end
end
