class Admin::AuthorController < ApplicationController

  before_filter :authenticate_user, :only => [:index, :new, :create, :show, :edit, :update, :destroy]

  def index
    @authors = Author.all
    @page_title = t(:listing_authors)
  end

  def new
    @author = Author.new
    @page_title = t(:add_a_new_author)
  end

  def create
    @author = Author.new(params[:author])
    if @author.save
      flash[:notice] = "#{t(:authors)} #{@author.name} #{t(:author_success_create)}"
      redirect_to :action => 'index'
    else
      @page_title = t(:add_a_new_author)
      render :action => 'new'
    end
  end

  def show
    @author = Author.find(params[:id])
    @page_title = @author.name
  end

  def edit
    @author = Author.find(params[:id])
    @page_title = t(:edit_author)
  end

  def update
    @author = Author.find(params[:id])
    if @author.update_attributes(params[:author])
      flash[:notice] = t(:author_success)
      redirect_to :action => 'show', :id => @author
    else
      @page_title = t(:edit_author)
      render :action => 'edit'
    end
  end

  def destroy
    @author = Author.find(params[:id])
    flash[:notice] = "#{t(:successfully_deleted_author)} #{@author.name}"
    @author.destroy
    redirect_to :action => 'index'
  end

end
