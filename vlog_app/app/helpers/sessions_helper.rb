module SessionsHelper
    # login helper
    def log_in(user)
        session[:user_id] = user.id
    end

    def current_user
        if session[:user_id]
            @current_user ||= User.find_by(id: session[:user_id])
        elsif cookies.signed[:user_id]
            user = User.find_by(id: cookies.signed[:user_id])
            if user && user.authenticated?(cookies[:remember_token])
                log_in user
                @current_user = user
            end
        end
    end

    # forget the current user
    def forget(user)
        user.forget
        cookies.delete(:user_id)
        cookies.delete(:remember_token)
    end

    def logged_in?
        !current_user.nil?
    end

    def log_out
        forget(current_user)
        session.delete(:user_id)
        @current_user = nil
    end

    def remember(user)
        user.remember
        cookies.permanent.signed[:user_id] = user.id
        cookies.permanent[:remember_token] = user.remember_token
        # cookies.permanet[:xxx] = xxx is similar with
        # cookies[:xxx] = {value: xxx, expires: 20.years.form_now.utc}
    end
end
