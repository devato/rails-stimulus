class Onboard::CreateOrganization < Rectify::Command
  def initialize(form)
    @form = form
  end

  def call
    return broadcast(:invalid) if form.invalid?

    transaction do
      create_organization
      connect_user_to_organization
      store_organization_in_session
    end

    broadcast(:ok)
  end

  private

  attr_reader :form, :organization

  def create_organization
    @organization = Organization.create do |org|
      org.name = form.name
      org.default = current_user.organizations.empty?
    end
  end

  def connect_user_to_organization
    Current.user.organizations << organization
  end

  def store_organization_in_session
    session[:current_organization] = Current.organization.slug
  end

end
