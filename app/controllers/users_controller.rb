class UsersController < ApplicationController

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.new(params)
    if user.save
      session[:user_id] = user.id
      redirect "workouts/new"
      # redirect "/users/#{user.id}"
    else
      redirect 'users/new'
    end
  end

  get '/users/login' do
    erb :'users/login'
  end

  post '/users' do
    @user = User.find_by(email: params[:email])

    if @user.authenticate(params[:password])
      session[:user_id] = user.id
    else
      redirect "user/#{@user.id}"
    end
  end

end


  get '/users/:id' do
    "this is the user's show page"
  end
