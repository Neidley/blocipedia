class WikisController < ApplicationController

  def index
    @wikis = policy_scope(Wiki)
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.new
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]
    @wiki.user = current_user

    add_collaborators(@wiki, params[:wiki][:collaborator_ids])

    if current_user.standard?
      @wiki.private = false
    else
      @wiki.private = false || true
    end

    if @wiki.save
      flash[:notice] = "Wiki was saved."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the wiki. Please try again."
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def update
    @wiki = Wiki.find(params[:id])
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]
    @wiki.private = params[:wiki][:private]
    if params[:wiki][:collaborators]
      @wiki.collaborators = []
      add_collaborators(@wiki, params[:wiki][:collaborator_ids])
    end


    if @wiki.save
      flash[:notice] = "Wiki was updated."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the wiki. Please try again."
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])

    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
      redirect_to wikis_path
    else
      flash.now[:alert] = "There was an error deleting the wiki."
      render :show
    end
  end

  private

  def add_collaborators(wiki, arr)
    arr.map!{|number| number.to_i} unless arr.nil?
    unless arr.nil?
      arr.each do |collaborator|
        unless collaborator == 0
          c = wiki.collaborators.new
          c.user = User.find(collaborator)
          c.save
        end
      end
    end
  end
end
