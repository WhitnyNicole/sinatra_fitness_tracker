require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "fitness"
    register Sinatra::Flash
  end

  get "/" do
    erb :index
  end


  helpers do

    def logged_in?
     !!current_user
    end

    def current_user
      @current_user ||= User.find(session[:user_id])
    end

    def authorized_to_edit_workout?(workout)
      workout.user == current_user
    end

    def authorized_to_edit_exercise?(exercise)
      exercise.user == current_user
    end

    def redirect_if_not_logged_in
      if !logged_in?
        flash[:errors] = "You must be logged in to view the page you tried to view."
        redirect '/'
      end
    end

    def redirect_if_logged_in
      if logged_in?
        redirect "/users/#{current_user.id}"
     end
   end
 end
end
