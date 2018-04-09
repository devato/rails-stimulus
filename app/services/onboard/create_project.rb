class Onboard::CreateProject < Rectify::Command
  def initialize(form)
    @form = form
  end

  def call
    return broadcast(:invalid) if form.invalid?

    transaction do
      create_project
      connect_project_data
    end

    broadcast(:ok)
  end

  private

  attr_reader :form, :project

  def create_project
    @project = Project.create do |p|
      p.name = form.name
      p.supported_language_id = form.supported_language_id
      p.organization_id = form.organization_id
    end
  end

  def connect_project_data
    current_user.projects << project
  end

end
