class BackpacksController < ApplicationController

  get '/backpacks' do
    @books = Book.all
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
      erb :'/backpack/new'
    end
  end

end
