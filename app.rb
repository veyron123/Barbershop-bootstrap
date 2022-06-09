#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do

	
	



	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"	
end

post "/" do
	@login=params[:login]
	@password=params[:password]

	if  @login == "veyron" && @password == "admin" 
		@login_in = "Welcome to BarberShop"

		erb "Welcome to site"
		
	else 
		@error= "Wrong login or password"

		erb "Wrong login or password"

		
		
	end

	
	
	

end

get '/about' do 
	@error = "something"
	erb :about
	
end

get '/contacts' do 	
	erb :contacts
end

post '/contacts' do 
	@email = params[:email]
	@comment = params[:comment]

	@message_contacts = "Мы ответим Вам в ближайшее время"

	f = File.open "public/contacts.txt", "a"
	f.write "#{@email} \n #{@comment}"
	f.close

	erb :contacts
end

get '/visit' do 
	erb :visit
end

post '/visit' do 

	@name = params[:username].capitalize
	@phone = params[:phone]
	@date = params[:date]
	@time = params[:time]
	@barber = params[:barber]
	@color = params[:color]

	if 
		@name == '' 
		@error = "Enter name"
		return erb :visit
	end

	@message = "Дорогой #{@name} мы ждем Вас в #{@time} #{@date}, ваш парикмахер #{@barber} ваш цвет #{@color}"

	# @title = "Приветствуем Вас!"
 
	@users= File.open "public/users.txt", "a"
	@users.write "Имя: #{@name}, телефон - #{@phone}, время - #{@time}, дата - #{@date}, парикмахер -#{@barber}\n"
	@users.close 

	erb :visit
end


