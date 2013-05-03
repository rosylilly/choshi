class UsersController < ApplicationController
  def index
    @users = decorate User.all
  end

  def show
    @user = decorate User.find(params[:id])
  end
end
