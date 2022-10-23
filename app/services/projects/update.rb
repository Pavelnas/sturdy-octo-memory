class Projects::Update
  include Interactor
  delegate :project, :project_params, :fail!, to: :context
  
  def call
    project = project.assign_attributes(project_params)

    fail!(error: project.errors) unless project.save
  end
end