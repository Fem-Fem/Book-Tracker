class BooksController < ApplicationController

  get '/books' do
    @books = Book.all
    erb :'/books/index'
  end

  get '/books/new' do
    @genres = ["Science", "Philosophy", "Fantasy", "Science-fiction", "Romance", "Young Adult"]
    erb :'/books/new'
  end

  post '/books' do
    binding.pry
    @book = Book.create(params[:book])
    @book.save
    redirect '/books'
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
