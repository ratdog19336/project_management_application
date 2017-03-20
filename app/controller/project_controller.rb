class ProjectController < ApplicationController

  get '/projects/new' do
    erb :'/projects/new_project'
  end

  post '/projects/new' do
    if Project.find_by(name: params[:name]) != nil
      @project = Project.find_by(name: params[:name])
      @project.user_id = current_user.id
      redirect "/#{@project.slug}"
    elsif params[:name] != ""
      @project = Project.create(name: params[:name])
      @project.user_id = current_user.id
      @project.save
      redirect "/#{@project.slug}"
    else
      redirect '/project/new'
    end
  end

  get '/:slug' do
    @project = Project.find_by_slug(params[:slug])
    erb :'/projects/project_view'
  end

  get '/:slug/edit' do
    @project = Project.find_by_slug(params[:slug])
    erb :'/projects/edit_project'
  end

  post '/:slug' do
    @project = Project.find_by_slug(params[:slug])
    @project.update(name: params[:name])
    redirect "/#{@project.slug}"
  end

  delete '/:slug/delete' do
    @project = Project.find_by_slug(params[:slug])
    @project.destroy
    redirect "/home"
  end

end
