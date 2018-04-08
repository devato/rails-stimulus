module Relay
  class SetCurrentObjects < Rectify::Command
    def initialize(user)
      @user = user
    end

    def call
      return broadcast(:not_logged_in) unless @user.present?

      transaction do
        set_current_user
        set_organization_as_tenant
      end
      broadcast(:ok)
    end

    private

    attr_reader :user, :organization

    def set_current_user
      Current.user = user
    end

    def set_organization_as_tenant
      if Current.user.present?
        Rails.logger.info "====== current org from service: #{Current&.organization&.slug}"
        Current.organization ||= Current.user.organizations.find_by(default: true)
      end
    end

  end
end
