class BooksController < ApplicationController

  get '/books' do
    @books = Book.all
    erb :'/books/index'
  end

  get '/books/new' do
    erb :'/books/new'
  end

  post '/books' do
    binding.pry
    erb :'/books'
  end

  get '/books/:id/edit' do
    @owner = Owner.find(params[:id])
    erb :'/owners/edit/#{params[:id]}'
  end

  get '/books/:id' do
    @book = Book.find(params[:id])
    erb :'/books/show'
  end

  post '/books/:id' do
  end

end
