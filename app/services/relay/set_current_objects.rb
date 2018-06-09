module Relay
  class SetCurrentObjects < Rectify::Command
    def initialize(user, params = {})
      @user = user
      @params = params
    end

    def call
      return broadcast(:not_logged_in) if @user.blank?

      transaction do
        set_current_user
        if Current.user.present?
          set_organization
          set_organizations
        end
      end
      broadcast(:ok)
    end

    private

    attr_reader :user, :organization

    def set_current_user
      Current.user = UserDecorator.new(user)
    end

    def set_organization
      Current.organization ||= Current.user.organizations.find_by(default: true)
    end

    def set_organizations
      Current.organizations ||= Current.user.organizations.where.not(id: Current.organization.id)
    end

  end
end
