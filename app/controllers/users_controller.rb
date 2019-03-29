class UsersController < ApplicationController

  #go to individual user's homepage
  #add the protection
    get '/users/:id' do
      @user = User.find_by(id: params[:id])
      erb :'users/show'
    end

    #log user out
      get '/logout' do
        session.clear
        redirect '/'
      end

#create user and sign up
  get '/signup' do
    erb :'users/signup'
  end

  post '/users' do
    user = User.new(params)
    if user.save
      session[:user_id] = user.id
      redirect "workouts/show"
      # redirect "/users/#{user.id}"
    else
      redirect 'signup'
    end
  end

  #alternate code to ensure all info filled out
#   post '/users' do
#     if params[:name] != "" && params[:email] != "" && params[:password] != ""
#       @user = User.new(params)
#       session[:user_id] = @user.id
#       redirect "users/#{@user.id}"
#     else
#       redirect 'users/signup'
#   end
# end

#allow returning user to log back in
  get '/login' do
    erb :'users/login'
  end

  post '/login' do
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      puts session
      redirect "users/#{@user.id}"
    else
      "Oops, that didn't work. Please log in."
      redirect "login"
    end
  end
end
