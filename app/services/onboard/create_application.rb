class Onboard::CreateApplication < Rectify::Command

  def initialize(form)
    @form = form
  end

  def call
    return broadcast(:invalid) if form.invalid?

    transaction do
      create_application
      connect_application_data
      set_onboard_state
      notify_admins
      audit_event
      send_user_details_to_crm
    end

    broadcast(:ok)
  end

  private

  attr_reader :form, :application

  def create_application
    @application = Application.create do |app|
      app.name = form.name
      app.supported_language_id = form.supported_language_id
      app.organization_id = form.organization_id
    end
  end

  def connect_application_data
    current_user.applications << application
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
