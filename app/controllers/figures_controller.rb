class FiguresController < ApplicationController
  
 get '/figures/new' do
 erb :'/figures/new'
 end

 post '/figures/new' do
  @figure = Figure.create(params[:figure])
  if !params[:title][:name].empty?
    @figure.titles << Title.create(name: params[:title][:name])
  end
  if !params[:landmark][:name].empty?
    @figure.landmarks << Landmark.create(name: params[:landmark][:name])
  end
  @figure.save
end
 
  get '/figures' do
  erb :'/figures/show'
end

get '/figures/:id' do
  @figure = Figure.find_by_id(params[:id])
  erb :'figures/single_figure'
end

get '/figures/:id/edit' do
  @figure = Figure.find_by_id(params[:id])
  erb :'/figures/edit'
end

patch '/figures/:id/edit' do
  @figure = Figure.find_by_id(params[:id])
  @figure.update(params[:figure])
  if !params[:landmark][:name].empty?
    @figure.landmarks << Landmark.create(params[:landmark])
   
   @figure.save
 end
   redirect  "/figures/#{@figure.id}"
   
  
end


end