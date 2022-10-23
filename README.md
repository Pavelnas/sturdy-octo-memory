# Documentation

# Getting Started

## Docker

it’s really simple you need to have docker and docker-compose installed in order to be able to run the project you need to run the following command in order to have the application running.

### X86

```bash
$ docker-compose up --build
```

### ARM or M1 chip

```bash
$ docker-compose -f docker-compose.m1.yml up --build
```

## On your machine

On your machine, you need to have the ruby `3.0.0` version installed or RVM for ruby virtual management.

```bash
$ bundle install

$ rails db:create db:migrate

$ rails s
```

# Design

---

The project design is based on Ruby on Rails 7 using ruby `3.0.0` following the MVC method that contains models, controllers, and views (JSON).

## Dependencies

- rails
- puma
- sqlite3
- rspec
- rswag `swagger api documentation`
- rack-cors
- httparty
- interaction
- faker
- rspec
- factory_bot_rails
- bye bug

## Models

The codebase consists of two models…

- Projects

```ruby
class Project < ApplicationRecord
  has_many :project_participants

  enum state: {
    planned: 0,
    active: 1,
    done: 2,
    failed: 3
  }
end
```

- ProjectsParticipants

```ruby
class ProjectParticipant < ApplicationRecord
  belongs_to :project
end
```

## Controllers

- ProjectsController
    - index to fetch all the projects
    - show to show specific project
    - create
    - update
    - assign_participant
    - destroy

## Services

- Create
- Update
- AssignParticipants

## API Handler

A specific class made for external API handler called `EmployeesApi` where has 2 main functions

- get_employees
- get_employee(id: String)

# Swagger

the app it’s provided a swagger interface that documents and facilitates the usage of stakeholders. 

After running the app successfully you should be able to run the swagger interface on [http://localhost:3000/api-docs/index.html](http://localhost:3000/api-docs/index.html)