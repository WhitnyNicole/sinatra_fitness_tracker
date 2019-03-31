class WorkoutsController < ApplicationController

  get "/workouts" do
    @workouts = Workout.all
    erb :"/workouts/index"
  end
#

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
      if @workut.user == current_user
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
      if @workut.user == current_user
        @workout.update(category: params[:category])
        redirect "/workouts/#{@workout.id}"
      else
        redirect "users/#{current_user.id}"
      end
    else
      redirect "/"
    end
  end

#
#   # DELETE: /workouts/5/delete
#   delete "/workouts/:id/delete" do
#     redirect "/workouts"
#   end


private
  def set_workout
    @workout = Workout.find(params[:id])
  end
end
