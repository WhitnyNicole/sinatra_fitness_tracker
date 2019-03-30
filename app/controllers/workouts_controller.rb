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
  # post "/workouts" do
  #   if !logged_in?
  #     redirect '/'
  #   end
  #   if params[:category] != ""
  #     @workout = Workout.create(category: params[:category], user_id: current_user.id)
  #     redirect "/workouts/#{@workout.id}"
  #     # redirect "/users/#{user.id}"
  #   else
  #     redirect 'workouts/new'
  #   end
  # end


# Try This
post '/workouts' do
  @workout = Workout.create(params["category"])
  if !params["workouts"]["category"].empty?
    @workout.user = User.create(name: params["user"]["name"])
  end
  @workout.save
  redirect "/users/#{user.id}"
end

#
# GET: /workouts/show
  get "/workouts/:id" do
    @workout = Workout.find(params[:id])
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
