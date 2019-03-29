class UsersController < ApplicationController

  get '/users/signup' do
    erb :'users/signup'
  end

  post '/users' do
    user = User.new(params)
    if user.save
      session[:user_id] = user.id
      redirect "workouts/show"
      # redirect "/users/#{user.id}"
    else
      redirect 'users/signup'
    end
  end

  get '/users/login' do
    erb :'users/login'
  end

  post '/users' do
    @user = User.find_by(email: params[:email])

    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      puts session
      redirect "users/#{@user.id}"
    else
      "Oops, that didn't work. Please log in."
      redirect "users/login"
    end
  end

end


  get '/users/:id' do
    "this is the user's show page"
  end
