require("bundler/setup")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
also_reload("lib/*.rb")

enable :sessions
#index page links and buttons
get("/") do
  session[:id] = 1
  erb(:index)
end

get("/login") do
  session[:id]

  test1 = session[:id]
  binding.pry
  erb(:login)
end

get("/sign_up") do
  erb(:sign_up)
end

post("/sign_up") do
  name = params.fetch('name')
  username = params.fetch('username')
  image = params.fetch('image')
  password = params.fetch('password')
  user = User.create({:username => username, :name => name, :image => image, :password =>password}) #create is the equivalent of user = User.new plus user.save()
  redirect('/')
end

get("/user") do
  erb(:user)
end

# test kevin
