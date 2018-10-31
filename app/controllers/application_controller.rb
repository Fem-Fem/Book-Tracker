require 'rack-flash'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  use Rack::Flash
  enable :sessions
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }


  helpers do
    def current_user
      Owner.find(session[:owner_id])
    end

    def is_logged_in?
      !!Owner.find(session[:owner_id])
    end
  end

end
