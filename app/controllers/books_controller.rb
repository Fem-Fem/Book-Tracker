class BooksController < ApplicationController

  get '/books' do
    redirect_to_login_or_signup_if_not_logged_in
    @books = Book.all
    erb :'/books/index'
  end

  get '/books/new' do
    redirect_to_login_or_signup_if_not_logged_in
    genres
    erb :'/books/new'
  end

  post '/books' do
    @book = current_user.books.build(params[:book])
    if @book.save
      redirect '/books'
    else
      @error = @book.errors.full_messages.to_sentence
      genres
      erb :'/books/new'
    end
  end

  get '/books/index' do
    redirect_to_login_or_signup_if_not_logged_in
    @books = Book.all
    erb :'/books/index'
  end

  get '/books/:id' do
    redirect_to_login_or_signup_if_not_logged_in
    @book = Book.find(params[:id])
    erb :'/books/show'
  end

  get '/books/:id/edit' do
    redirect_to_login_or_signup_if_not_logged_in
    genres
    @book = Book.find(params[:id])
    if current_user.id != @book.owner_id
      redirect '/books'
    else
      erb :'/books/edit'
    end
  end

  patch '/books/:id' do
    @book = Book.find(params[:id])
    @book.title = params[:book][:title]
    @book.author = params[:book][:author]
    @book.genre = params[:book][:genre]
    @book.summary = params[:book][:summary]
    binding.pry
    if @book.valid?
      @book.save
      redirect to "/books/#{@book.id}"
    else
      genres
      @error = @book.errors.full_messages.to_sentence
      erb :"/books/edit"
    end
  end

  get '/books/:id/delete' do
    redirect_to_login_or_signup_if_not_logged_in
    @book = Book.find(params[:id])
    if current_user.id == @book.owner_id
      @book.destroy
      redirect to '/books'
    else
      redirect to '/books'
    end
  end

end
