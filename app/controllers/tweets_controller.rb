class TweetsController < ApplicationController

    get '/tweets/new' do
        @user = User.find(session[:user_id])
        if logged_in?
            erb :'/tweets/new'
        else
            redirect to ("/failure")
        end
    end

    get '/tweets' do
        if logged_in?
            @user = User.find(session[:user_id])
            @tweets = Tweet.all
            erb :'/tweets/index'
        else
            redirect to ("/failure")
        end
    end

    post '/tweets' do
        Tweet.create(params[:tweet])
        redirect to ("/tweets")
    end
end
