class MissionsController < ApplicationController

    #INDEX
    get '/missions' do
        @missions = current_user.missions
        erb :"/missions/index"
    end

    #CREATE
    get '/missions/new' do
        if logged_in?
            erb :"/missions/new"
        else
            flash[:error] = "You must log in to create a new mission."
            redirect "/"
        end
    end

    post '/missions' do
        @mission = current_user.missions.create(title: params[:title], description: params[:description])
        if @mission.save
            redirect "/missions"
        else
            flash[:error] = "Please fill out all fields to create your mission."
            redirect '/missions/new'
        end
    end 

    #READ
    get '/missions/:id' do
        @mission = Mission.find(params[:id])
        erb :'/missions/show'
    end

    #UPDATE
    get '/missions/:id/edit' do
        @mission = Mission.find(params[:id])
        if @mission.user_id == current_user.id
            erb :'/missions/edit'
        else
            flash[:error] = "You are not authorized to edit this mission."
            redirect "/missions"
        end
    end

    patch '/missions/:id' do
        @mission = Mission.find_by_id(params[:id])
        @mission.update(title: params[:title], description: params[:description])
        redirect "/missions/#{@mission.id}"
    end

    #DELETE

    delete '/missions/:id/delete' do
        mission = Mission.find_by(id: params[:id]) 
        user = current_user(session)
        mission.user
        if mission && mission.user == current_user(session)
            mission.destroy
        redirect to "/users/#{user.id}" 
    end 
end