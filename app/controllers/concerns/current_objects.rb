module CurrentObjects

  extend ActiveSupport::Concern

  included do

    set_current_tenant_through_filter
    before_action :set_organization_as_tenant
    before_action :set_current_user

    def set_organization_as_tenant
      unless @organization = Current.organization
        @organization = current_user.organizations.find_by(default: true)
      end
      Current.organization = @organization
      set_current_tenant(@organization)
    end

    def set_current_user
      Current.user = current_user
    end

    def set_current_supported_languages
      Current.supported_languages = SupportedLanguage.active
    end

  end

end

