class NoteController < ApplicationController

  get '/:slug/notes/new' do
    @project = Project.find_by_slug(params[:slug])
    erb :'/notes/new_note'
  end

  post '/:slug/notes/new' do
    if Note.find_by(name: params[:name]) != nil
      @note = Note.find_by(name: params[:name])
      @note.project = Project.find_by_slug(params[:slug])
      @note.user = current_user
      redirect "/#{@note.project.slug}/notes/#{@note.id}"
    elsif params[:name] != ""
      @note = Note.create(name: params[:name], content: params[:content])
      @note.project = Project.find_by_slug(params[:slug])
      @note.user = current_user
      @note.save
      redirect "/#{@note.project.slug}/notes/#{@note.id}"
    else
      redirect '/project/new'
    end
  end

  get '/:slug/notes/:id/edit' do
    @note = Note.find_by(id: params[:id])
    erb :'/notes/edit_note'
  end

  post '/:slug/notes/:id' do
    @note = Note.find_by(id: params[:id])
    @note.update(name: params[:name], content: params[:content])
    redirect "/#{@note.project.slug}/notes/#{@note.id}"
  end

  get '/:slug/notes/:id' do
    @note = Note.find_by(id: params[:id])
    erb :'/notes/note_view'
  end

  delete '/:slug/notes/:id/delete' do
    binding.pry
    @note = Note.find_by(id: params[:id])
    @note.destroy
    redirect "/#{@note.project.slug}"
  end

end
