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
  u.artist = false
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

10.times do |i|
  Project.create! do |p|
    p.title = "project#{i}"
    p.total_amount = 100000
    p.target_amount = 1000000
    p.url = ""
    p.image_url = 'http://moka-suyasuya.c.blog.so-net.ne.jp/_images/blog/_cd5/moka-suyasuya/gazou2044-fc29e.jpg?c=a0'
    p.user_id = i + 1
    p.payment_tag = '<form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">
    <input type="hidden" name="cmd" value="_s-xclick">
    <input type="hidden" name="hosted_button_id" value="4ZFXVTD83UMRG">
    <table>
    <tr><td><input type="hidden" name="on0" value="リワード">リワード</td></tr><tr><td><select name="os0">
      <option value="オプション1">オプション1 ¥1,000 JPY</option>
        <option value="オプション2">オプション2 ¥1,000 JPY</option>
          <option value="オプション1+2">オプション1+2 ¥2,000 JPY</option>
          </select> </td></tr>
          </table>
          <input type="hidden" name="currency_code" value="JPY">
          <input type="image" src="https://www.sandbox.paypal.com/ja_JP/JP/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal - オンラインでより安全・簡単にお支払い">
          <img alt="" border="0" src="https://www.sandbox.paypal.com/ja_JP/i/scr/pixel.gif" width="1" height="1">
          </form>'
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

AdminUser.delete_all
AdminUser.create! do |a|
  a.email = "awl.developer+admin@gmail.com"
  a.password = "moguraotaku"
  a.password_confirmation = "moguraotaku"
end
