class Onboard::CreateOrganization < Rectify::Command

  def initialize(form)
    @form = form
  end

  def call
    return broadcast(:invalid) if form.invalid?

    transaction do
      create_organization
      connect_user_to_organization
      set_onboard_state
      notify_admins
      audit_event
      send_user_details_to_crm
    end

    broadcast(:ok)
  end

  private

  attr_reader :form, :organization

  def create_organization
    @organization = Organization.create do |org|
      org.name = form.name
    end
  end

  def connect_user_to_organization
    current_user.organizations << organization
  end

  def set_onboard_state
    current_user.onboard.organization_created!
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
