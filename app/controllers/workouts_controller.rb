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
    workout = Workout.new(params)
    if workout.save
      session[:workout_id] = workout.id
      redirect "exercises/new"
      # redirect "/users/#{user.id}"
    else
      redirect 'workouts/new'
    end
    # redirect "/workouts"
  end
#
# GET: /workouts/show
get "/workouts/show" do
  erb :"workouts/show"
end
#
# POST: /workouts
post "/workouts" do
  erb :"workouts/show"
  # redirect "/workouts"
end

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
