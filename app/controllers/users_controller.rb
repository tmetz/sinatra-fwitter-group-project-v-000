class UsersController < ApplicationController
    
    get '/signup' do
        erb :'users/create_user'
    end
    
    get "/login" do
        erb :login
    end

    get "/users/:slug" do
        redirect to ("/tweets")
    end
        
    post "/login" do
        user = User.find_by(:username => params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect "/users/#{user.slug}"
        else
            redirect "/failure"
        end
    end
        
    get "/failure" do
        erb :failure
    end

    helpers do
        def logged_in?
            !!session[:user_id]
        end
    
        def current_user
          User.find(session[:user_id])
        end
    end
        
end