class OwnersController < ApplicationController

  get '/' do
    erb :'/account'
  end

  get '/owners' do
    # if self.is_logged_in?(session)
      @owners = Owner.all
      erb :'/owners/index'
    # else
    #   erb :error
    # end
  end

  get '/owners/new' do
    erb :'/owners/new'
  end

  post '/owners' do
    binding.pry
    @owner = Owner.create(params[:owner])
    @owner.save
    redirect to "/owners"
  end

  get '/owners/:id/edit' do
    if self.is_logged_in?(session)
      @owners = Owner.all
      erb :'/owners/index'
    else
      erb :error
    end
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
    erb :'/owners/signup'
  end

  post '/signup' do
    binding.pry
    if params["owner"] == "" || params["password"] == ""
      redirect to '/signup'
    else
      @owner = Owner.create(:username => params["username"],:password => params["password"])
      session[:user_id] = @owner.id
      redirect to '/books'
    end
  end

  get '/sessions/login' do
    erb :'/owners/login'
  end

  post '/login' do
    binding.pry
    if session[:user_id] == nil
       erb :login
     else
       redirect to '/books'
     end
  end

  get '/logout' do
    session.clear
    redirect "/"
  end
end
