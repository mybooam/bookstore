class AuthorsController < ApplicationController
  def new
    @page_title = 'Add new Author'
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      flash[:notice] = "Author created"
      redirect_to authors_path
    else
      render 'new'
    end
  end

  def update
    @author = Author.find(params[:id])
    @author.update(author_params)
    flash[:notice] = "Author udpated"
    redirect_to authors_path
  end

  def edit
    @author = Author.find(params[:id])
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy
    flash[:notice] = "Autor removed"
    redirect_to authors_path
  end

  def index
    @authors = Author.all.order("last_name ASC")
  end

  def show
     @author = Author.find(params[:id])
     @authors = Author.all
     @books = @author.books
  end

  private
  def author_params
    params.require(:author).permit(:first_name, :last_name)
  end
  
end
