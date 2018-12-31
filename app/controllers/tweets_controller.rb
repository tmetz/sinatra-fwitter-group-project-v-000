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
      # binding.pry
        if logged_in?
            @tweets = Tweet.all
            erb :'/tweets/index'
        else
            redirect to ("/failure")
        end
    end

    post '/tweets' do
      # binding.pry
        Tweet.create(params[:tweet])
        redirect to ("/tweets")
    end
end
