desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do

  p "Creating sample data"

  #Destroy Previous Data
  if Rails.env.development?
    FollowRequest.destroy_all
    Comment.destroy_all
    Like.destroy_all
    Photo.destroy_all
    User.destroy_all
  end

  #Generate Users
  12.times do
    name = Faker::Name.first_name
    User.create(
      email: "#{name}@example.com",
      password: "password",
      username: name,
      private: [true, false].sample,
    )
  end

  p "There are now #{User.count} users."

  #Generate Follow Requests
  users = User.all
  users.each do |first_user|
    users.each do |second_user|
      if rand < 0.75
        first_user.sent_follow_requests.create(
          recipient: second_user,
          status: FollowRequest.statuses.keys.sample
        )
      end

      if rand < 0.75
        second_user.sent_follow_requests.create(
          recipient: first_user,
          status: FollowRequest.statuses.keys.sample
        )
      end
    end
  end

  p "There are now #{FollowRequest.count} follow requests."

  # Generate Photos

  # Generate Likes

  # Generate Comments

end
