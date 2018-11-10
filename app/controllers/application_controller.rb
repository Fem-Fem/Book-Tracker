require 'rack-flash'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  use Rack::Flash
  enable :sessions
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }


  helpers do

    def current_user
      if session[:owner_id]
        return Owner.find(session[:owner_id])
      else
        return false
      end
    end

    def is_logged_in?
      if session[:owner_id]
        return !!Owner.find(session[:owner_id])
      else
        return false
      end
    end

    def redirect_to_login_or_signup_if_not_logged_in
      if !is_logged_in?
        redirect to '/users/error'
      end
    end

    def genres
      @genres = ["Fantasy", "Fiction", "History", "Non-fiction", "Romance", "Science", "Science-fiction", "Philosophy", "Young Adult"]
    end
  end

end
