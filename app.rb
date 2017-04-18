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

get("/user") do
  @cuisines = Cuisine.all()
  @districts = District.all()
  @budgets = Budget.all()
  @cuisine = params.fetch("cuisine")
  @district = params.fetch("district")
  @budget = params.fetch("budget")
  erb(:user)
end



# test kevin
