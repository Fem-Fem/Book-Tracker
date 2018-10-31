class BooksController < ApplicationController

  get '/books' do
    is_logged_in?
    @books = Book.all
    erb :'/books/index'
  end

  get '/books/new' do
    @genres = ["Science", "Philosophy", "Fantasy", "Science-fiction", "Romance", "Young Adult"]
    erb :'/books/new'
  end

  post '/books' do
    @book = current_user.books.build(params[:book])
    # @book = Book.new(params[:book])
    # @book.owner_id = session[:owner_id]
    if @book.save
      redirect '/books'
    else
      @error = @book.errors.full_messages.to_sentence
      @genres = ["Science", "Philosophy", "Fantasy", "Science-fiction", "Romance", "Young Adult"]
      erb :'/books/new'
    end
  end

  get '/books/:id/edit' do
    # raise params.inspect
    @book = Book.find(params[:id])
    if session[:owner_id] == nil
      redirect to '/login'
    elsif session[:owner_id] != @book.owner_id
      redirect '/books'
    else
      erb :'/books/edit'
    end
  end

  get '/books/:id/delete' do
    @book = Book.find(params[:id])
    if session[:owner_id] == nil
      redirect to '/login'
    elsif session[:owner_id] != @book.owner_id
      redirect '/books'
    else
      Book.delete(params[:id])
      redirect to '/books'
    end
  end

  get '/books/:id' do
    #redirect_if_not_logged_in
    @book = Book.find(params[:id])
    erb :'/books/show'
  end

end
