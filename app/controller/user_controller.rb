class UserController < ApplicationController

  get '/home' do
    @user = current_user
    erb :'/users/home'
  end


end
