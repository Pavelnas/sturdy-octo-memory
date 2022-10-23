class Projects::AssignParticipants
  include Interactor
  delegate :project, :participant_id, to: :context

  def call
    context.project_participant = ProjectParticipant.new(project: project, participant_id: participant_id)

    # Validate owner & participant in the same department
    employee_api_client = EmployeesApi.new
    owner = employee_api_client.get_employee(project.owner_id)
    participant = employee_api_client.get_employee(participant_id)
    
    fail!(error: 'Participant should be in the same department as the owner') unless participant.department == owner.department

    fail!(error: project_participant.errors) unless project_participant.save
  end
end