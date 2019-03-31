class ExercisesController < ApplicationController
#   # GET: /exercises
  get "/exercises" do
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
    if params[:reps] && params[:weight] && params[:day] != ""
      @exercise = Exercise.create(reps: params[:reps], weight: params[:weight], day: params[:day])
      flash[:message] = "Congrats, you've entered a new exercise!"
      redirect "/exercises"
    else
      flash[:errors] = "Oops, that exercise could not be created."
      redirect 'exercises/new'
    end
  end

  get "/exercises/:id" do
    set_exercise
    erb :"exercises/show"
  end

  get "/exercises/:id/edit" do
    set_exercise
    if logged_in?
      if @exercise.user == current_user
        erb :"exercises/edit"
      else
        redirect "users/#{current_user.id}"
      end
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
