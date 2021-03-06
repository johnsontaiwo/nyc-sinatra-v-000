class LandmarksController < ApplicationController

  get '/landmarks/new' do
  erb :'/landmarks/new'
  end

  post '/landmarks/new' do
    @landmark = Landmark.create(params[:landmark])
  end

   get '/landmarks' do
    erb :'/landmarks/index'
    
   end
  
  get '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'/landmarks/show'
  end
  
  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'/landmarks/edit'
  end

  patch '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id])
    @landmark.update(params[:landmark])
    redirect "/landmarks/#{@landmark.id}"
  end
end
