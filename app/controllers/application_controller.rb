class ApplicationController < ActionController::API
    def login
        admin = Admin.find_by_admin_email(params[:email])
        if admin
            if params[:password] == admin.password
                render json: admin, only: [:id,:admin_email]
            else
            render json: {error:"wrong password"}
            end
        else
            user = User.find_by_email(params[:email])
            if user
                if params[:password] == user.password
                    render json: user, only: [:id,:name,:email,:daily_calories,:remaining_calories]
                else
                render json: {error:"wrong password"}
                end
            else
                render json: {error:"user not found"}
            end
        end

        
    end

    def login_params
        params.require(:login_p).permit(:email, :password)
    end
end
