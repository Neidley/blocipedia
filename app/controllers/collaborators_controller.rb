class CollaboratorsController < ApplicationController
  def create
    @collaborator = Collaborator.new
    @collaborator.wiki_id = params[:collaborator][:wiki_id]
    @collaborator.user_id = params[:collaborator][:user_id]

    if @collaborator.save
      flash[:notice] = "Collaborator(s) was saved."
      redirect_to wikis_path
    else
      flash.now[:alert] = "There was an error saving the collaborator(s). Please try again."
      redirect_to wikis_path
    end
  end

  def edit
    @collaborator = Collaborator.find(params[:id])
  end

end
