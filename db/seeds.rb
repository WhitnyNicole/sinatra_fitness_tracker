User.create(name: "Whitny", email: "whitny@test.com", password: "password")
User.create(name: "Britny", email: "britny@test.com", password: "password")

Workout.create(category: "Upper Body", user_id: whitny.id)
