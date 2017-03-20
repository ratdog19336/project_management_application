require 'pry'
require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get '/' do
    session.clear
    erb :index
  end

  get '/signup' do
    if logged_in?
      @user = current_user
      redirect "/users/home"
    else
      erb :'/home/signup'
    end
  end

  post "/signup" do
    if User.find_by(username: params[:username]) != nil
      @user = User.find_by(username: params[:username])
      session[:id] = @user.id
      redirect "/home"
    elsif logged_in?
      @user = current_user
      redirect "/home"
    elsif params[:username] != "" && params[:password] != ""
      @user = User.create(username: params[:username], password: params[:password])
      session[:id] = @user.id
      redirect "/home"
    else
      redirect "/signup"
    end
  end

  get "/login" do
    if logged_in?
      @user = current_user
      redirect "/home"
    else
      erb :'/home/login'
    end
  end

  post "/login" do
    @user = User.find_by(:username => params[:username])
    if @user && @user.authenticate(params[:password])
      @user = User.find_by(:username => params[:username])
      session[:id] = @user.id
      redirect "/home"
    else
      redirect "/failure"
    end
  end

  get "/success" do
    if logged_in?
      erb :success
    else
      redirect "/login"
    end
  end

  get "/failure" do
    erb :failure
  end

  get "/logout" do
    session.clear
    redirect "/login"
  end

  helpers do
    def logged_in?
      !!session[:id]
    end

    def current_user
      User.find(session[:id])
    end
  end
end
