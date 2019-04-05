class UsersController < ApplicationController

    # get '/users/:id' do
    #   @user = User.find_by(id: params[:id])
    #   erb :'users/show'
    # end

    get "/users/:id" do
      @user = User.find_by(id: params[:id])
      if @user.nil?
        redirect "/"
      elsif current_user && @user.id == current_user.id
        erb :"users/show"
      else
        flash[:errors] = "You cannot view that page."
        redirect "users/#{current_user.id}"
      end
    end

    get '/logout' do
        session.clear
        redirect '/login'
      end

    get '/signup' do
      erb :'users/signup'
    end

    post '/users' do
      @user = User.new(params)
      if @user.save
        session[:user_id] = @user.id
        flash[:message] = "You have successfully created an account. Welcome!"
        redirect "/users/#{@user.id}"
      else
        flash[:errors] = "Sorry, please create an account. Must enter name, email and password"
        redirect 'signup'
      end
    end

    get '/login' do
      erb :'users/login'
    end

    post '/login' do
      @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        flash[:message] = "Welcome, #{@user.name}!"
        redirect "users/#{@user.id}"
      else
        flash[:errors] = "Your credentials were invalid.  Please sign up or try again."
        redirect "login"
      end
    end
  end
