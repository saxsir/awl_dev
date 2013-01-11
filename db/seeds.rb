# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# User
User.delete_all
User.connection.execute("delete from sqlite_sequence where name='users'")

10.times do |i|
  User.create! do |u|
    # user_1 ~ user_10
    u.email = "awl_dev+user#{i + 1}@gmail.com"
    u.password = "userpass"
    u.password_confirmation = "userpass"
    u.artist = false
  end
end


# Project
Project.delete_all
Project.connection.execute("delete from sqlite_sequence where name='projects'")

10.times do |i|
  Project.create! do |p|
    p.title = ""
    p.total_amount = 100000
    p.target_amount = 1000000
    p.url = ""
    p.user_id = i + 1
    p.payment_tag = "kara"
  end
end

# Reward
Reward.delete_all
Reward.connection.execute("delete from sqlite_sequence where name='rewards'")

10.times do |i|
  Reward.create! do |r|
    r.description = "hogehoge"
    r.project_id = i + 1
    r.title = "sample"
  end
end

# Support
Support.delete_all
Support.connection.execute("delete from sqlite_sequence where name='supports'")

10.times do |i|
  Support.create! do |s|
    s.amount = 1000
    s.project_id = i + 1
    s.reward_id = i + 1
    s.user_id = i + 1
  end
end
