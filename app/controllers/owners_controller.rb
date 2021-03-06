class OwnersController < ApplicationController

  get '/' do
    erb :'/account'
  end

  get '/error' do
    erb :'owners/error'
  end

  get '/owners' do
    redirect_to_login_or_signup_if_not_logged_in
    @owners = Owner.all
    erb :'/owners/index'
  end

  get '/owners/new' do
    redirect_to_login_or_signup_if_not_logged_in
    erb :'/owners/new'
  end

  post '/owners' do
    @owner = Owner.create(params[:owner])
    @owner.save
    redirect to "/owners"
  end

  get '/signup' do
    erb :'/owners/signup'
  end

  post '/signup' do
    @owner = Owner.new(:username => params[:username],:password => params[:password],:name => params[:name])
    if @owner.save
      session[:owner_id] = @owner.id
      redirect to '/books'
    else
      @errors = @owner.errors.full_messages.to_sentence
      erb :'/owners/signup'
    end
  end

  get '/login' do
    erb :'/owners/login'
  end

  post '/login' do
    owner = Owner.find_by(:username => params[:username])
    if owner && owner.authenticate(params[:password])
      session[:owner_id] = owner.id
      redirect to '/books'
    else
      @errors =  "Invalid combination!"
      erb :'/owners/login'
    end
  end

  get '/logout' do
    session.clear
    redirect "/"
  end

  get '/owners/:id' do
    redirect_to_login_or_signup_if_not_logged_in
    @owner = Owner.find(params[:id])
    erb :'/owners/show'
  end

end
