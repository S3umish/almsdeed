class UsersController < ApplicationController

    get '/login' do
        erb :login
    end

    post '/login' do
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            flash[:message] = "You have successfully logged in."
            redirect '/missions'
        else
            flash[:error] = "Either username or password is incorrect, please try again."
            redirect '/login'
        end
    end

    get '/signup' do
        erb :'/users/signup'
    end

    post '/signup' do
        user = User.new(params)
        if user.save
            session[:user_id]= @user.id
            redirect "/users/#{@user.id}"
        else
            @errors = user.errors.full_messages.to_sentence
            erb :"/users/signup"
        end
        # if params[:username] == "" || params[:password] == ""
        #     flash[:error] = "Either username or password is empty, please try again."
        #     redirect "/signup"
        # else
        #     @user = User.new(params)
        #     @user.save
        #     session[:user_id] = @user.id
        #     redirect "/missions"
        # end  
    end

    get '/logout' do
        if logged_in?
            session.clear
            redirect '/'
        else
            redirect '/'
        end
    end
end