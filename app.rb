require "sinatra"
require "sinatra/activerecord"
configure { set :server, :puma }

ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: "./sample.db"
)

class User < ActiveRecord::Base
end

get "/" do
  { count: User.count }.to_json
end

get "/name" do
  User.find_by!(name: params["user_name"], published: true).to_json
end
