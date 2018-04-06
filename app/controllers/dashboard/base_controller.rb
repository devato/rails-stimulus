class Dashboard::BaseController < ApplicationController
  layout 'dashboard'

  before_action :redirect_to_onboard
  # before_action :set_organization

  def redirect_to_onboard
    unless current_user.onboard_complete?
      redirect_to :onboard_organization
    end
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
