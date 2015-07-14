require "sinatra"
require "sinatra/activerecord"

set :database, {adapter: "sqlite3", database: "example.sqlite3"}

class Users < ActiveRecord::Base
end

get "/" do
  @users = Users.all
  erb :index
end

post "/users/create" do
  user = Users.new({ name: params[:name], email: params[:email]})
  user.save
  redirect "/"
end