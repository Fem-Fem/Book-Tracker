class OwnersController < ApplicationController

  get '/' do
    erb :'/account'
  end

  get '/owners/index' do
    binding.pry
    if is_logged_in?
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
    @owner = Owner.create(params[:owner])
    @owner.save
    redirect to "/owners"
  end

  post '/checkout' do
    session[:item] = params[:item]
  end

  get '/signup' do
    erb :'/users/signup'
  end

  post '/signup' do
    @owner = Owner.new(:username => params[:username],:password => params[:password],:name => params[:name])
    binding.pry
    if @owner.save
      session[:owner_id] = @owner.id
      redirect to '/books'
    else
      @errors = @owner.errors.full_messages.to_sentence
      erb :'/users/signup'
    end
  end

  get '/login' do
    erb :'/users/login'
  end

  post '/login' do
    owner = Owner.find_by(:username => params[:username])
    binding.pry
    if owner && owner.authenticate(params[:password])
      session[:owner_id] = owner.id
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
    if session[:user_id] == nil
      erb :'/owners/error'
    else
      erb :'/owners/edit'
    end
  end

  get '/owners/:id' do
    @owner = Owner.find(params[:id])
    erb :'/owners/show'
  end

end
