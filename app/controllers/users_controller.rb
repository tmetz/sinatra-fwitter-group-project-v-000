class UsersController < ApplicationController
<<<<<<< HEAD

  get '/signup' do
    erb :'users/create_user'
  end



=======
    get "/login" do
        erb :login
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
>>>>>>> 44f424c1435b0869a06c8ecbdc9a4312b970be1c

end
