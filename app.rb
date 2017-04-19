require("bundler/setup")
Bundler.require(:default)
require('pry')
require('rickshaw')
require('rack')
require "sinatra/reloader"

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
also_reload("lib/*.rb")

configure do
  enable :sessions
end

register do
  def auth (type)
    condition do
      redirect "/login" unless send("is_#{type}?")
    end
  end
end

helpers do
  def is_user?
    @user != nil
  end
end

before do
  if session[:id] == nil
    @user = nil
  else
    @user = User.find(session[:id])
  end
end

#index page links and buttons
get "/",  :auth => :user do
  @id = @user.id()
  erb(:index)
end

get("/login") do
  erb(:login)
end

post('/users') do
  username = params.fetch('username')
  password = params.fetch('password').to_sha1()
  @user = User.find_by(username: username, password: password)
  # not yet complete
  if @user != nil
    session[:id] = @user.id
    redirect('/user')
  else
    redirect('/login')
  end
end

get("/sign_up") do
  erb(:sign_up)
end

post("/sign_up") do
  name = params.fetch('name')
  username = params.fetch('username')
  image = params.fetch('image')
  password = params.fetch('password').to_sha1()
  @user = User.new({:username => username, :name => name, :image => image, :password =>password})
  if @user.save()
    session[:id] = @user.id
    redirect('/user')
  else
    erb(:errors)
  end
end
#test
get "/success", :auth => :user do
  erb(:success)
end

get("/admin") do
  erb(:admin)
end

post("/admin") do
  cuisineName = params.fetch("cuisine")
  districtName = params.fetch("district")
  budgetName = params.fetch("budget")
  Cuisine.where(:name => cuisineName).first_or_create({:name => cuisineName})
  District.where(:name => districtName).first_or_create({:name => districtName})
  Budget.where(:scale => budgetName).first_or_create({:scale => budgetName})
  redirect('/admin')
end

get"/user", :auth => :user do
  @cuisines = Cuisine.all()
  @districts = District.all()
  @budgets = Budget.all()
  @user = User.find(params.fetch('id'))
  erb(:user)
end

patch("/user") do
  cuisine_id = params.fetch("cuisine_id")
  district_id = params.fetch("district_id")
  budget_id = params.fetch("budget_id")
  @user.update({:cuisine_id => cuisine_id, :district_id => district_id, :budget_id => budget_id})
  redirect('/match_making')
end

get('/match_making') do
  @users = User.all()
  erb(:match_making)
end

get('/logout') do
  session.clear
  redirect('/')
end

get('/matching') do
  @users = User.all()
  erb(:matching)
end

post('/matching') do
  redirect('/matching')
end
