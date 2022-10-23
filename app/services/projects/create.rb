class Projects::Create
  include Interactor
  delegate :project_params, :fail!, to: :context
  
  def call
    context.project = Project.new(project_params)

    fail!(error: context.project.errors) unless context.project.save
  end
end