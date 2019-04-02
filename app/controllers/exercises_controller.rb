class ExercisesController < ApplicationController
#   # GET: /exercises
  get "/exercises" do
    @exercises = Exercise.all
    erb :"exercises/index"
  end
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
    if params[:reps] && params[:weight] && params[:day] && params[:intensity]!= ""
      @exercise = Exercise.new(params)
      flash[:message] = "Congrats, you've entered a new exercise!"
      redirect "/exercises"
    else
      flash[:errors] = "Oops, that exercise could not be created."
      redirect "/workouts/#{@workout.id}"
    end
  end

  get "/exercises/:id" do
    set_exercise
    erb :"exercises/show"
  end

  get "/exercises/:id/edit" do
    set_exercise
    if logged_in? && @exercise.workout.user == current_user
        erb :"exercises/edit"
      # else
      #   redirect "users/#{current_user.id}"
      # end
    else
      redirect "/"
    end
  end



#   # PATCH: /exercises/5
#   patch "/exercises/:id" do
#     redirect "/exercises/:id"
#   end
#
#   # DELETE: /exercises/5/delete
#   delete "/exercises/:id/delete" do
#     redirect "/exercises"
#   end

private
  def set_exercise
    @exercise = Exercise.find(params[:id])
  end
end
