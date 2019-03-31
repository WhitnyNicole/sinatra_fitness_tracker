class ExercisesController < ApplicationController
#   # GET: /exercises
#   get "/exercises" do
#     erb :"/exercises/index.html"
#   end
#
  # GET: /exercises/new
  get "/exercises/new" do
    erb :"/exercises/new"
  end

  # POST: /exercises
  post "/exercises" do
    if !logged_in?
      redirect '/'
    end
    if params[:reps] && params[:weight] && params[:day] != ""
      @workout = Workout.create(reps: params[:reps], user_id: current_user.id, weight: params[:weight], day: params[:day])
      flash[:message] = "Congrats, you've entered a new exercise!"
      redirect "/exercises"
    else
      flash[:errors] = "Oops, that exercise could not be created."
      redirect 'exercises/new'
    end
  end
# #
#   # GET: /exercises/5
#   get "/exercises/:id" do
#     erb :"/exercises/show.html"
#   end
#
#   # GET: /exercises/5/edit
#   get "/exercises/:id/edit" do
#     erb :"/exercises/edit.html"
#   end
#
#   # PATCH: /exercises/5
#   patch "/exercises/:id" do
#     redirect "/exercises/:id"
#   end
#
#   # DELETE: /exercises/5/delete
#   delete "/exercises/:id/delete" do
#     redirect "/exercises"
#   end
end
