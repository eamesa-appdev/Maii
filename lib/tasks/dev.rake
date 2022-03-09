desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment}) do
  User.destroy_all

  user = User.create email: "alice@example.com", password: "password"
  
  20.times do
    task = Task.new
    task.body = "Body of the comment"
    task.status = ["not yet started", "in progress", "complete"].sample
    task.user_id = user.id
    task.save
  end
end
