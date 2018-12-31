class UsersController < ApplicationController

    get '/signup' do
        erb :'users/create_user'
    end

    post '/signup' do
      if !params[:username].empty? && !params[:email].empty? && !params[:password].empty?
        @user = User.create(username: params[:username], email: params[:email], password: params[:password])
        session[:user_id] = @user.id
        #binding.pry
        redirect "/tweets"
      else
        redirect "/signup"
      end
    end

    get "/login" do
        if logged_in?
            redirect "/tweets"
        else
            erb :"/users/login"
        end
    end

    get "/users/:slug" do
        if logged_in?
            @tweets = Tweet.where(["user_id = ?"], User.find_by_slug(params[:slug]).id)
            erb :'/tweets/index'
        else
            redirect to ("/failure")
        end
    end

    post "/login" do
        user = User.find_by(:username => params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect "/tweets"
        else
            redirect "/failure"
        end
    end

    get "/failure" do
        erb :failure
    end



end
