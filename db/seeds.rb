User.destroy_all
Mission.destroy_all


users.each do |user|
    User.create(user)
end


test1 = User.create(username: "test2", password: "pw")
test2 = User.create(username: "test3", password: "pw")
test3 = User.create(username: "test4", password: "pw")


Mission.create(title: "Red Cross", description: "Blood donation camp setup", user_id: test1.id)
Mission.create(title: "Gleaners", description: "Food bank -sort and pack food", user_id: test1.id)
Mission.create(title: "Elms Community Service", description: "computer classes for seniors", user_id: test2.id)

missions.each do |mission|
    Mission.create(mission)
end 