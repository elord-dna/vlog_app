class MicropostsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]

    def create
        @micropost = current_user.microposts.build(micropost_params)
        if @micropost.save
            format.html { redirect_to root_url, notice: 'Micropost created!'}
        else
            render 'static_pages/home'
        end
    end

    
    private

        def micropost_params
            params.require(:micropost).permit(:content)
        end
end
