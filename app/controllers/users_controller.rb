class UsersController < ApplicationController

    get '/signup' do
      if logged_in?
        redirect '/tweets'
      else
        erb :'users/create_user'
      end
    end

    post '/signup' do
      if !params[:username].empty? && !params[:email].empty? && !params[:password].empty?
        @user = User.create(username: params[:username], email: params[:email], password: params[:password])
        session[:user_id] = @user.id
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

    get '/logout' do
      if logged_in?
        session.clear
        redirect '/login'
      else
        redirect '/failure'
      end
    end


    get "/users/:slug" do
        @user = User.find_by_slug(params[:slug])
        @tweets = Tweet.where(["user_id = ?", @user.id])
        erb :'/tweets/index'
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
