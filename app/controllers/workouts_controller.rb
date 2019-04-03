class WorkoutsController < ApplicationController

  get "/workouts" do
    @workouts = current_user.workouts
    erb :"/workouts/index"
  end

  get "/workouts/new" do
    erb :"workouts/new"
  end

  post "/workouts" do
    redirect_if_not_logged_in
    if params[:category] && params[:duration] && params[:user_id]!= ""
      @workout = Workout.new(params)
      @workout.save
      flash[:message] = "Congrats, you entered a new workout!" if @workout.id
      redirect "/workouts/#{@workout.id}"
    else
      flash[:errors] = "Oops, that workout could not be created."
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

  # get "/workouts/:id/edit" do
  #   set_workout
  #   if logged_in?
  #     if @workout.user == current_user
  #       erb :"workouts/edit"
  #     else
  #       redirect "users/#{current_user.id}"
  #     end
  #   else
  #     redirect "/"
  #   end
  # end

  get "/workouts/:id/edit" do
    set_workout
    redirect_if_not_logged_in
    if authorized_to_edit_workout?(@workout)
      erb :"workouts/edit"
    else
      redirect "users/#{current_user.id}"
    end
  end

  patch "/workouts/:id" do
    set_workout
    redirect_if_not_logged_in
      if @workout.user == current_user && params[:category] && params[:duration] != ""
         @workout.update(category: params[:category], duration: params[:duration])
         flash[:message] = "Your changes were saved!"
         redirect "/workouts/#{@workout.id}"
      else
        flash[:errors] = "Sorry, you cannot edit that entry."
        redirect "users/#{current_user.id}"
      end
    end

  # patch "/workouts/:id" do
  #   set_workout
  #   if logged_in?
  #     if @workout.user == current_user && params[:category] != ""
  #       @workout.update(category: params[:category])
  #       redirect "/workouts/#{@workout.id}"
  #     else
  #       redirect "users/#{current_user.id}"
  #     end
  #   else
  #     flash[:errors] = "Sorry, you cannot edit that entry."
  #     redirect "/"
  #   end
  # end

  delete "/workouts/:id" do
    set_workout
    if authorized_to_edit_workout?(@workout)
      @workout.category.destroy
      flash[:message] = "That entry was successfully deleted."
      redirect "/workouts"
    else
      flash[:errors] = "Sorry, you cannot delete that entry."
      redirect "/workouts"
    end
  end

  private
    def set_workout
      @workout = Workout.find(params[:id])
    end
  end
