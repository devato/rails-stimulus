class Dashboard::BaseController < ApplicationController
  layout 'dashboard'

  set_current_tenant_through_filter
  before_action :set_organization_as_tenant

  before_action :redirect_to_onboard
  # before_action :set_organization

  def redirect_to_onboard
    # redirect_to :onboard_organization unless current_user.onboard_complete?
  end

  def set_organization_as_tenant
    unless @organization = Current.organization
      @organization = current_user.organizations.find_by(default: true)
    end
    set_current_tenant(@organization)

  end
  # def set_organization
  #   if params[:organization_id].present?
  #     @organization = current_user.organizations.friendly.find(params[:organization_id])
  #   end
  #   @other_organizations = current_user.organizations.where.not(id: @organization.id)
  # rescue ActiveRecord::RecordNotFound
  #   @organization = current_user.organizations.default
  #   redirect_to organization_root_path(@organization.slug)
  # end
end
