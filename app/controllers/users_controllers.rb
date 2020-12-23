class UsersController < ApplicationController

    get '/signup' do
        erb :'/users/signup'
    end

    post '/signup' do
        user = User.new(params)
        if user.save
            session[:user_id]= user.id
            redirect "/missions"
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
end