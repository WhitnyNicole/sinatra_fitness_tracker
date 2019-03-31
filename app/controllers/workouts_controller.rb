class WorkoutsController < ApplicationController

  get "/workouts" do
    @workouts = Workout.all
    erb :"/workouts/index"
  end

  get "/workouts/new" do
    erb :"workouts/new"
  end

  post "/workouts" do
    if !logged_in?
      redirect '/'
    end
    if params[:category] != ""
      @workout = Workout.create(category: params[:category], user_id: current_user.id)
      redirect "/exercises/new"
    else
      redirect 'workouts/new'
    end
  end

  # post "/workouts" do
  #   workout = Workout.new(params)
  #   if workout.save
  #     session[:user_id] = user.id
  #     # redirect "workouts/show"
  #     flash[:message] = "You have selected a category. Now add the details!"
  #     redirect "/workouts/#{@workout.id}"
  #   else
  #     flash[:message] = "Sorry, please select a category."
  #     redirect 'workouts/new'
  #   end
  # end

  get "/workouts/:id" do
    set_workout
    erb :"workouts/show"
  end

  get "/workouts/:id/edit" do
    set_workout
    if logged_in?
      if @workout.user == current_user
        erb :"workouts/edit"
      else
        redirect "users/#{current_user.id}"
      end
    else
      redirect "/"
    end
  end

  patch "/workouts/:id" do
    set_workout
    if logged_in?
      if @workout.user == current_user && params[:category] != ""
        @workout.update(category: params[:category])
        redirect "/workouts/#{@workout.id}"
      else
        redirect "users/#{current_user.id}"
      end
    else
      flash[:message] = "Sorry, you cannot edit that entry."
      redirect "/"
    end
  end

  delete "/workouts/:id" do
    set_workout
    if current_user == @workout.user
      @workout.category.destroy
      flash[:message] = "That entry was successfully deleted."
      redirect "/workouts"
    else
      flash[:message] = "Sorry, you cannot delete that entry."
      redirect "/workouts"
    end
  end

  private
    def set_workout
      @workout = Workout.find(params[:id])
    end
  end
