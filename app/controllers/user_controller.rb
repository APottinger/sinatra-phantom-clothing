class UserController < ApplicationController
    #if already logged in (use a helper) redirect to landing page
    get '/signup' do
        erb :'users/signup'
    end

    post '/signup' do
        #change to .new so the data doesn't persist without validation
        @user = User.new(username: params[:username], password: params[:password])
        if @user.save
            session[:user_id] = @user.id
            redirect "users/#{@user.id}"
        else
            erb :'users/signup'
        end
    
    end

    get '/login' do
        erb :'users/login'
    end
    #include functionality that checks if logged in/not to bolster user functionality
    post '/login' do
        @user = User.find_by(username: params[:username])
        if @user
            session[:user_id] = @user.id
            binding.pry
            redirect "users/#{@user.id}"
        else
            @err = "Invalid Credentials"
            erb :'users/login'
        end
    end

    get '/users/:id' do
        @user = User.find_by(id: session[:user_id])
        erb :'users/index'
    end

    delete '/users/login' do
        session.clear
        redirect '/login'
      end
end