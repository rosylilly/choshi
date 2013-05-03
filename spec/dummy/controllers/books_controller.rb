class BooksController < ApplicationController
  def index
    @user = decorate User.find(params[:user_id])
  end
end
