class EmployeesApi
  include HTTParty
  base_uri ENV.fetch('EMPLOYEES_API_URL')

  def initailize; end

  def get_employees
    res = self.class.get('/employees')
    OpentStruct.new(res.parsed_response)
  end

  def get_employee(id)
    res = self.class.get("/employees/#{id}")
    OpenStruct.new(res.parsed_response)
  end

end