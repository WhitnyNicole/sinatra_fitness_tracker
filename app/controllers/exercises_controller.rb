class ExercisesController < ApplicationController

    get "/exercises" do
      @exercises = current_user.exercises
      erb :"exercises/index"
    end


    get "/exercises/new" do
      erb :"/exercises/new"
    end

    post "/exercises" do
      redirect_if_not_logged_in
      if params[:reps] && params[:weight] && params[:day] && params[:intensity] && params[:move] && params[:sets] && params[:workout_id]!= ""
        @exercise = Exercise.new(params)
        @exercise.save
        flash[:message] = "Congrats, you've entered a new exercise!"
        redirect "/exercises/#{@exercise.id}"
      else
        flash[:errors] = "Oops, that exercise could not be created."
        redirect "/exercises/new"
      end
    end


    get "/exercises/:id" do
      set_exercise
      erb :"exercises/show"
    end

    get "/exercises/:id/edit" do
      set_exercise
      redirect_if_not_logged_in
      if @exercise.workout.user == current_user
        erb :"exercises/edit"
      else
        redirect "users/#{current_user.id}"
      end
    end

    patch "/exercises/:id" do
      set_exercise
      redirect_if_not_logged_in
      if @exercise.workout.user == current_user && params[:reps] && params[:weight] && params[:day] && params[:intensity] && params[:move] && params[:sets] != ""
        @exercise.update(reps: params[:reps], weight: params[:weight], day: params[:day], intensity: params[:intensity], move: params[:move], sets: params[:sets])
        flash[:message] = "Your changes were saved!"
        redirect "/exercises/#{@exercise.id}"
      else
        flash[:errors] = "Sorry, you cannot edit that entry."
        redirect "users/#{current_user.id}"
      end
    end

    delete "/exercises/:id" do
      set_exercise
      if @exercise.workout.user == current_user
        @exercise.destroy
        flash[:message] = "That entry was successfully deleted."
        redirect "/exercises"
      else
        flash[:errors] = "Sorry, you cannot delete that entry."
        redirect "/exercises"
      end
    end

private
  def set_exercise
    @exercise = Exercise.find(params[:id])
  end
end
