class OwnersController < ApplicationController

  get '/' do
    erb :'/account'
  end

  get '/owners' do
    if self.is_logged_in?(session)
      @owners = Owner.all
      erb :'/owners/index'
    else
      erb :error
    end
  end

  get '/owners/new' do
    erb :'/owners/new'
  end

  post '/owners' do
    binding.pry
    @owner = Owner.create(params[:owner])
    @owner.save
    redirect to "owners/#{@owner.id}"
  end

  get '/owners/:id/edit' do
  end

  get '/owners/:id' do
    @owner = Owner.find(params[:id])
    erb :'/owners/show/{params[:id]}'
  end

  post '/owners/:id' do

  end

  post '/checkout' do
    session[:item] = params[:item]
  end

  get '/registrations/signup' do
    erb :'/registrations/signup/'
  end

  post '/registrations/signup' do
    @current_owner = Owner.find_by(username: params["username"], password: params["password"])
    if @current_owner
      session[:user_id] = @current_owner[:id]
      redirect "/books"
    else
      erb :error
    end
  end

  get '/sessions/login' do
    redirect "/sessions/login"
  end

  post '/sessions/login' do
    @current_owner = Owner.find_by(username: params["username"], password: params["password"])
    if @current_owner
      session[:user_id] = @current_owner[:id]
      redirect "/books"
    else
      erb :error
    end
  end

  get '/logout' do
    session.clear
    redirect "/"
  end
end
