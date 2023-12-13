class UsersController < ApplicationController
    before_action :authenticate_user!
    def index
      @users = current_user
      @users = User.all
    end
    
end