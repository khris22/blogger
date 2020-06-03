class Api::V1::SessionsController < ApplicationController

     # creating a session
    def create
        user = User.find_by(username: params[:session][:username])
         if user && user.authenticate(params[:session][:password])
             session[:user_id] = user.id
             render json: UserSerializer.new(current_user).to_serialized_json, status: 200
         else
             render json: {
                 error: "Invalid Username or Password"
             }
         end
     end

     def get_current_user
        if logged_in?
          render json: UserSerializer.new(current_user)
        else
          render json: {
            error: "No one is logged in."
          }
        end
      end

      def destroy
        session.clear
        render json: {
          notice: "You have successfully logged out."
        }, status: 200
      end

end