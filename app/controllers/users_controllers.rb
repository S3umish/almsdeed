class UsersController < ApplicationController

    get "/signup" do
        erb :"users/signup"
    end

    post "/signup" do
        user = User.new(params)
        if user.save
            session[:user_id]=user.user_id
            redirect"/missions"
        else
            @error = "Invalid Cerdentials"
            erb :"users/signup"
        end
    end
     
    
end