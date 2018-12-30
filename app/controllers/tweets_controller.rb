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
            @tweets = Tweet.where(["user_id = ?", current_user.id)
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
