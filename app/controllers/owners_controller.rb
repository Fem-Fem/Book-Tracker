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
    redirect to "/owners"
  end

  post '/checkout' do
    session[:item] = params[:item]
  end

  get '/registrations/signup' do
    erb :'/owners/signup'
  end

  post '/registrations/signup' do
    @owner = Owner.new(:username => params[:username],:password_digest => params[:password],:name => params[:name])
    binding.pry
    if @owner.save
      session[:user_id] = @owner.id
      redirect to '/books'
    else
      @error = @owner.errors.full_messages.to_sentence
      erb :'/registrations/signup'
    end
  end

  get '/sessions/login' do
    erb :'/owners/login'
  end

  post '/sessions/login' do
    binding.pry
    owner = Owner.find_by(:username => params[:username])
    if owner && owner.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to '/books'
    else
      erb :'/owners/error'
    end
  end

  get '/logout' do
    session.clear
    redirect "/"
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
end
