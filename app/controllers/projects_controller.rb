class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :update, :destroy, :assign_participant]

  def index
    projects = Project.all
    render json: projects, status: :ok
  end

  def show
    render json: @project, status: :ok
  end

  def create
    result = Projects::Create.call(project_params: project_params)

    if result.success?
      render json: result.project, status: :created
    else
      render json: result.error, status: :unprocessable_entity
    end
  end

  def update
    result = Projects::Update.call(project: @project, project_params: project_params)

    if result.success?
      render json: result.project, status: :ok
    else
      render json: result.error, status: :unprocessable_entity
    end
  end

  def assign_participant
    result = Projects::AssignParticipant.call(project: @project, participant_id: params[:participant_id])

    if result.success?
      render json: result.project, status: :ok
    else
      render json: result.error, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :owner_id, :state)
  end
end
