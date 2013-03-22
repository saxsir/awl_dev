# -*- encoding: utf-8 -*-
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

User.create! do |u|
  u.username = "user"
  u.email = "awl_dev+user@gmail.com"
  u.password = "userpass"
  u.password_confirmation = "userpass"
  u.artist = false
end

User.create! do |u|
  u.username = "artist"
  u.email = "awl_dev+artist@gmail.com"
  u.password = "artistpass"
  u.password_confirmation = "artistpass"
  u.artist = true
end

User.create! do |u|
  u.username = "nikezono"
  u.email = "awl_dev+nikezono@gmail.com"
  u.password = "nikezono"
  u.password_confirmation = "nikezono"
  u.artist = true
end

User.create! do |u|
  u.username = "saxsir"
  u.email = "awl_dev+saxsir@gmail.com"
  u.password = "saxsir"
  u.password_confirmation = "saxsir"
  u.artist = false
end


# Project
Project.delete_all
Project.connection.execute("delete from sqlite_sequence where name='projects'")

# Reward
Reward.delete_all
Reward.connection.execute("delete from sqlite_sequence where name='rewards'")

# Support
Support.delete_all
Support.connection.execute("delete from sqlite_sequence where name='supports'")

# Admin
AdminUser.delete_all
AdminUser.create! do |a|
  a.email = "awl.developer+admin@gmail.com"
  a.password = "adminpass"
  a.password_confirmation = "adminpass"
end
