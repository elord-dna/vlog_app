class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    respond_to do |format|
      if user && user.authenticate(params[:session][:password])
        log_in user
        format.html { redirect_to user, notice: 'Success to login in'}
        format.json { render :show, status: :login, location: user }
      else
        format.html(redirect_to :login)
        format.json()
      end
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
