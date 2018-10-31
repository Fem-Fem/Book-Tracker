class BackpacksController < ApplicationController

  get '/backpacks' do
    @books = Book.all
    erb :'/backpacks/index'
  end

  get '/backpacks/new' do
    erb :'/backpacks/new'
  end

end
