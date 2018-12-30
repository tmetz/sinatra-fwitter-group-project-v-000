class TweetsController < ApplicationController

    get '/tweets/new' do
        @user = User.find(session[:user_id])
        erb :'/tweets/new'
    end

    get '/tweets' do
        @tweets = Tweet.where(["user_id = ?", session[:user_id]])
        erb :'/tweets/index'
    end

    post '/tweets' do
        Tweet.create(params[:tweet])
        redirect to ("/tweets")
    end
end
