class ProjectsController < ApplicationController
  load_and_authorize_resource

  def create
    @project = Project.new(project_params)
    @project.company_id = current_user.company_id
    @project.owner_id = current_user.id

    if @project.save
      redirect_to projects_path, notice: 'Project was successfully created.'
    else
      render :new
    end
  end

  def update
    if @project.owner_id == current_user.id
      if @project.update(project_params)
        redirect_to projects_path, notice: 'Project was successfully updated.'
      else
        render :edit
      end
    else
      redirect_to projects_path, alert: 'You are not authorized to update this project.'
    end
  end

  def destroy
    if @project.owner_id == current_user.id
      @project.destroy
      redirect_to projects_path, notice: 'Project was successfully deleted.'
    else
      redirect_to projects_path, alert: 'You are not authorized to delete this project.'
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :description, :status)
  end
end