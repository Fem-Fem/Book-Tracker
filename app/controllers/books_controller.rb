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
    binding.pry
    @book = Book.find(params["id"])
    if session[:user_id] == nil
      redirect to '/owners/login'
    elsif session[:user_id] != @book.user_id
      erb :index
    else
      erb :edit
    end
  end

  delete '/books/:id/delete' do
    binding.pry
    if session[:user_id] != @book.user_id.to_i
      redirect to '/books'
    else
      Book.delete(params["id"])
      redirect to '/books'
    end
  end

  delete '/tweet/:id/delete' do
    @tweet = Tweet.find(params["captures"][0].to_i)
    if session[:user_id] == params["id"].to_i
      Tweet.delete(params["id"])
      redirect to '/tweets'
    else
      redirect to '/tweets'
    end
  end

  get '/books/:id' do
    @book = Book.find(params[:id])
    erb :'/books/show'
  end
  
end
