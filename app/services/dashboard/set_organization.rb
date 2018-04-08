module Dashboard
  class SetOrganization < Rectify::Command
    def initialize(form)
      @form = form
      unless @organization = Current.organization
        @organization = current_user.organizations.find_by(default: true)
      end
      set_current_tenant(@organization)
    end

    def call
      return broadcast(:org) if form.invalid?

      transaction do

      end

      broadcast(:ok, @user)
    end

    private

    attr_reader :organization

    def

  end
end
