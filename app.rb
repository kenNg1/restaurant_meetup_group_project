require("bundler/setup")
Bundler.require(:default)
require('pry')
require('rickshaw')
require('rack')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
also_reload("lib/*.rb")


  enable :sessions

#index page links and buttons
get("/") do
  erb(:index)
end

get("/login") do
  erb(:login)
end

post('/users') do
  username = params.fetch('username')
  password = params.fetch('password').to_sha1()
  user = User.find_by(username: username, password: password)
  redirect('/')
end

get("/sign_up") do
  erb(:sign_up)
end

post("/sign_up") do
  name = params.fetch('name')
  username = params.fetch('username')
  image = params.fetch('image')
  password = params.fetch('password').to_sha1()
  @user = User.create({:username => username, :name => name, :image => image, :password =>password}) #create is the equivalent of user = User.new plus user.save()
  session[:id] = @user.id
  redirect('/success')
end

get("/user") do
  erb(:user)
end

get ("/success") do
  session[:id]
  binding.pry
  @user = User.find(session[:id])
  erb(:success)
end
