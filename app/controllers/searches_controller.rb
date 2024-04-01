class SearchesController < ApplicationController

  def search
    @type = params[:type]
    @search = params[:search]
    if params[:type] == "book"
      if params[:method] == 'perfect'
        @books = Book.where("title LIKE ?", "#{@search}")
      elsif params[:method] == 'forward'
        @books = Book.where("title LIKE ?", "#{@search}%")
      elsif params[:method] == 'backward'
        @books = Book.where("title LIKE ?", "%#{@search}")
      else
        @books = Book.where("title LIKE ?", "%#{@search}%")
      end
    elsif params[:type] == "user"
      if params[:method] == 'perfect'
        @users = User.where("name LIKE ?", "#{@search}")
      elsif params[:method] == 'forward'
        @users = User.where("name LIKE ?", "#{@search}%")
      elsif params[:method] == 'backward'
        @users = User.where("name LIKE ?", "%#{@search}")
      else
        @users = User.where("name LIKE ?", "%#{@search}%")
      end
    else
      @books = Book.where("tag LIKE ?", "#{@search}")
    end
  end

end
