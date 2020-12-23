class SessionsController < ApplicationController

    get '/login' do
        if logged_in?
            redirect"/missions"
        end
        erb :login
    end

    post '/login' do
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            flash[:message] = "Welcome!!"
            redirect '/missions'
        else
            flash[:error] = "Either username or password is incorrect, please try again."
            redirect '/login'
        end
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