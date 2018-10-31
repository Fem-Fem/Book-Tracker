require 'rack-flash'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  use Rack::Flash
  enable :sessions
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }


  helpers do
    # def redirect_if_not_logged_in
    #   binding.pry
    #   if !is_logged_in?
    #     redirect_to :'/owners/error'
    #   end
    # end

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
  end

end
