class Onboard::CreateProject < Rectify::Command

  def initialize(form)
    @form = form
  end

  def call
    return broadcast(:invalid) if form.invalid?

    transaction do
      create_project
      connect_project_data
      set_onboard_state
      notify_admins
      audit_event
      send_user_details_to_crm
    end

    broadcast(:ok)
  end

  private

  attr_reader :form, :project

  def create_project
    @project = Project.create do |app|
      app.name = form.name
      app.supported_language_id = form.supported_language_id
      app.organization_id = form.organization_id
    end
  end

  def connect_project_data
    current_user.projects << project
  end

  def set_onboard_state
    current_user.onboard.finish!
  end

  def notify_admins
    # ...
  end

  def audit_event
    # ...
  end

  def send_user_details_to_crm
    # ...
  end


end
