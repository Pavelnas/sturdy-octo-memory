# frozen_string_literal: true

require 'swagger_helper'

describe 'Project API' do
  path '/projects' do
    post 'Employee can Creates a Project' do
      tags 'Project'
      consumes 'application/json'
      parameter name: :project, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          owner_id: { type: :integer },
          state: { type: :string, enum: %i(active planning done failed) }
        },
        required: %w(name owner_id state),
      }

      response '201', 'Project created' do
        let(:project) { attributes_for(:project) }
        
        run_test!
      end
    end
  end

  path '/projects/{id}' do
    put 'Employee can UPDATES a `Project`' do
      tags 'Project'
      consumes 'application/json'
      parameter name: :id, in: :path
      parameter name: :project, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          owner_id: { type: :integer },
          state: { type: :string, enum: %i(active planning done failed) }
        },
        required: %w(name owner_id state),
      }

      let(:project) { create(:project) }
      response '200', 'Project updated' do
        let(:id) { project.id }
        let(:project) { attributes_for(:project) }

        run_test!
      end
    end
  end

  path '/projects' do
    get 'Employee can Retrieves all projects' do
      tags 'Project'
      produces 'application/json'

      response '200', 'Project' do
        run_test!
      end
    end
  end

  path '/projects/{id}' do
    get 'Employee can Show a Project' do
      tags 'Project'
      produces 'application/json'
      parameter name: :id, in: :path

      let(:project) { create(:project) }
      response '200', 'project found' do
        let(:id) { project.id }
        run_test!
      end
    end
  end

  path '/projects/{id}' do
    delete 'Employee can Delete a Project' do
      tags 'Project'
      produces 'application/json'
      parameter name: :id, in: :path

      let(:project) { create(:project) }
      response '204', 'project found' do
        let(:id) { project.id }
        run_test!
      end
    end
  end
end
