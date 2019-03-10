class ApplicationController < ActionController::Base
    include SessionsHelper

    private

    # 确保用户已登录
    def logged_in_user
      unless logged_in?
        # store_location
        # redirect_to login_url
        format.html { redirect_to :login, notice: '您还没有登陆，请登陆'}
      end
    end
end
