module CurrentObjects

  extend ActiveSupport::Concern

  included do

    set_current_tenant_through_filter
    before_action :set_current_objects

    def set_current_objects
      Relay::SetCurrentObjects.call(current_user)
      set_current_tenant(Current.organization) if Current.organization.present?
    end

    def set_current_supported_languages
      Current.supported_languages = SupportedLanguage.active
    end

  end

end

