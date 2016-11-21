5.times do |no|
  User.create(:name => "タイトル #{no}", :email => "#{no}@#{no}.com", :password => "#{no}",:password_confirmation => "#{no}")
  5.times do |i|
      Relationship.create(:followed_id => i, :follower_id => no)
      Micropost.create(:user_id => i, :content => "マイクロポストコンテント　#{no}")
  end
end


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
