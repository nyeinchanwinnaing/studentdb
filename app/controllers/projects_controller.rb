class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]

  # GET /projects or /projects.json
  def index
    @projects = Project.all
    respond_to do |format|
    format.html
    format.json { render json: @projects }
    format.xml { render xml: @projects }
    end
  end

  # GET /projects/1 or /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects or /projects.json
  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    if @project.project_evaluations.exists?
      # Handle the case where project_evaluations exist
      # For example, set a flash message and redirect
      flash[:alert] = "Cannot delete project with existing evaluations."
      redirect_to projects_url
    else
      @project.destroy
      respond_to do |format|
        format.html { redirect_to projects_url, notice: "Project was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:name, :url)
    end
end
