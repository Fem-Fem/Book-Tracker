class BooksController < ApplicationController

  get '/books' do
    redirect_to_login_or_signup_if_not_logged_in
    @books = Book.all
    erb :'/books/index'
  end

  get '/books/new' do
    redirect_to_login_or_signup_if_not_logged_in
    @genres = ["Science", "Philosophy", "Fantasy", "Science-fiction", "Romance", "Young Adult"]
    erb :'/books/new'
  end

  post '/books' do
    @book = current_user.books.build(params[:book])
    if @book.save
      redirect '/books'
    else
      @error = @book.errors.full_messages.to_sentence
      @genres = ["Science", "Philosophy", "Fantasy", "Science-fiction", "Romance", "Young Adult"]
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
    @genres = ["Science", "Philosophy", "Fantasy", "Science-fiction", "Romance", "Young Adult"]
    @book = Book.find(params[:id])
    if current_user.id != @book.owner_id
      redirect '/books'
    else
      erb :'/books/edit'
    end
  end

  patch '/books/:id' do
    # raise params.inspect
    @book = Book.find(params[:id])
    @book.title = params[:book][:title]
    @book.author = params[:book][:author]
    @book.genre = params[:book][:genre]
    @book.summary = params[:book][:summary]
    @book.save
    redirect to "/books/#{@book.id}"
  end

  get '/books/:id/delete' do
    redirect_to_login_or_signup_if_not_logged_in
    @book = Book.find(params[:id])
    binding.pry
    if current_user.id == @book.owner_id
      Book.delete(params[:id])
    else
      redirect to '/books'
    end
  end

end
