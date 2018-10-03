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

  post '/registrations/signup' do
    binding.pry
    if params["owner"] == "" || params["password"] == ""
      redirect to 'registrations/signup'
    else
      @owner = Owner.new(:username => params[:username],:password => params[:password],:name => params[:name])
      session[:user_id] = @owner.id
      redirect to '/books'
    end
  end

  get '/sessions/login' do
    erb :'/owners/login'
  end

  post '/login' do
    owner = Owner.find_by(:username => params[:username])
    if owner && owner.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/books"
    else
      redirect "/login"
    end
  end

  get '/logout' do
    session.clear
    redirect "/"
  end
end
