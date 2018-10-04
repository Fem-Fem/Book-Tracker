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
    @book = Book.new(params[:book])
    if @book.save
      redirect '/books'
    else
      @error = @book.errors.full_messages.to_sentence
      @genres = ["Science", "Philosophy", "Fantasy", "Science-fiction", "Romance", "Young Adult"]
      erb :'/books/new'
    end
  end

  get '/books/:id/edit' do

  #  @owner = Owner.find(params[:id])
  # get current user, make sure user id == book user id
    erb :'/owners/edit/#{params[:id]}'
  end

  get '/books/:id' do
    @book = Book.find(params[:id])
    erb :'/books/show'
  end

  post '/books/:id' do
  end

end
