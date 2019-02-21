class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    respond_to do |format|
      if user && user.authenticate(params[:session][:password])
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        format.html { redirect_to user, notice: 'Success to login in'}
        format.json { render :show, status: :login, location: user }
      else
        format.html { redirect_to :login, notice: '你可能输入了错误的邮箱地址或者密码'}
      end
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
