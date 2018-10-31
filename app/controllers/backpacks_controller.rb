class BackpacksController < ApplicationController

  get '/backpacks' do
    binding.pry
    @backpacks = Backpack.all
    erb :'/backpacks/index'
  end

  get '/backpacks/new' do
    erb :'/backpacks/new'
  end

  post '/backpacks' do
    @backpack = Backpack.new(params[:backpack])
    if @backpack.save
      redirect_to '/backpacks/index'
    else
      @error = @backpack.errors.full_messages.to_sentence
      erb :'/backpacks/new'
    end
  end

  get '/backpacks/:id' do
    @backpacks = Backpack.find(params[:id])
    erb :'/backpacks/show'
  end

  get '/backpacks/:id/edit' do
    @backpacks = Backpack.find(params["id"])
    if session[:user_id] == nil
      redirect to '/owners/login'
    elsif session[:user_id] != @backpack.user_id
      erb :index
    else
      erb :edit
    end
  end

  delete '/backpacks/:id/delete' do
    ### @backpacks = Backpack.find(params[:id])
    if session[:user_id] != @backpacks.user_id.to_i
      redirect to '/backpacks'
    else
      Backpack.delete(params["id"])
      redirect to '/backpacks'
    end
  end

end
