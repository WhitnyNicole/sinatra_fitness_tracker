# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app -- Models (users, exercises and workouts) Views(show, create, edit, index, signup, new, login), Controllers (users, application, workouts, exercises). Routes utilized (GET/POST/PATCH/DESTROY)
- [x] Use ActiveRecord for storing information in a database  --Active Record used. Models all inherit from ActiveRecord::Base
- [x] Include more than one model class (e.g. User, Post, Category) --- three models used: users, exercises and workouts
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)  --- A user has_many workouts. A workout has_many exercises
- [x ] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) --- A workout belongs_to a user. An exercise belongs_to a workout.
- [x] Include user accounts with unique login attribute (username or email) --- Users must login with a unique email address
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying --- Full CRUD!
- [x] Ensure that users can't modify content created by other users -- A user can only see a workout or exercise that belongs ot them and they cannot modify any other user's content
- [x] Include user input validations --- Name/email/password required to create a new account. Params cannot be empty when creating a new workout or exercise. Users/workouts/exercises all need to have id's
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)--- included flash messages for success and failures
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code --- README included with all requirements

Confirm
- [x] You have a large number of small Git commits --- Yes
- [x] Your commit messages are meaningful --- Yes
- [x] You made the changes in a commit that relate to the commit message -- Yes
- [x] You don't include changes in a commit that aren't related to the commit message -- Yes
