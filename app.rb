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

	@message = " Дорогой #{@name} мы ждем Вас в #{@time} #{@date}, ваш парикмахер #{@barber}"

	# @title = "Приветствуем Вас!"
 
	@users= File.open "public/users.txt", "a"
	@users.write "Имя: #{@name}, телефон - #{@phone}, время - #{@time}, дата - #{@date}, парикмахер -#{@barber}\n"
	@users.close 

	erb :visit
end


