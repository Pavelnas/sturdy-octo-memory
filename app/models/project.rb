class Project < ApplicationRecord
  has_many :project_participants

  validate :owner_to_be_manager

  enum state: {
    planned: 0,
    active: 1,
    done: 2,
    failed: 3
  }

  def owner_to_be_manager
    employee = EmployeeApi.new.get_employee(owner_id)
    errors.add(:owner_id, 'must be a manager') unless employee.role == 'manager'
  end
end
