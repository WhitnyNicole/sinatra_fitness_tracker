class WorkoutsController < ApplicationController
#   # GET: /workouts
#   get "/workouts" do
#     erb :"/workouts/index"
#   end
#
  # GET: /workouts/new
  get "/workouts/new" do
    erb :"workouts/new"
  end
#
  # POST: /workouts
  post "/workouts" do
    if !logged_in?
      redirect '/'
    end
    if params[:category] != ""
      @workout = Workout.create(category: params[:category], user_id: current_user.id)
      redirect "/exercises/new"
      # redirect "/users/#{user.id}"
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

#
# GET: /workouts/show
  get "/workouts/:id" do
    @workout = Workout.find(params[:id])
    erb :"workouts/show"
  end

  get "/workouts/:id/edit" do
    erb :"workouts/edit"
  end
#
# POST: /workouts
  # post "/workouts" do
  #   erb :"workouts/show"
  # # redirect "/workouts"
  # end

#   # GET: /workouts/5
#   get "/workouts/:id" do
#     erb :"/workouts/show.html"
#   end
#
#   # GET: /workouts/5/edit
#   get "/workouts/:id/edit" do
#     erb :"/workouts/edit.html"
#   end
#
#   # PATCH: /workouts/5
#   patch "/workouts/:id" do
#     redirect "/workouts/:id"
#   end
#
#   # DELETE: /workouts/5/delete
#   delete "/workouts/:id/delete" do
#     redirect "/workouts"
#   end
end
