class Dashboard::OnboardController < Dashboard::BaseController
  include Rectify::ControllerHelpers

  skip_before_action :redirect_to_onboard
  before_action :set_onboarding
  before_action :set_supported_languages, only: [:project]

  def organization
    if request.get?
      redirect_to :onboard_project if current_user.organizations.size > 0
      @form = Onboard::OrganizationForm.new
    elsif request.post?
      @form = Onboard::OrganizationForm.from_params(params)
      Onboard::CreateOrganization.call(@form) do
        on(:ok) do
          flash[:notice] = 'Successfully created organization'
          redirect_back_or_to :onboard_project
        end
        on(:invalid) { render :organization }
      end
    end
  end

  def project

    present Onboard::ProjectPresenter.new(user: current_user)

    if request.get?
      redirect_to organization_root_path(presenter.organization_slug) if current_user.onboard.complete?
      redirect_to :onboard_organization if current_user.organizations.size == 0
      @form = Onboard::ProjectForm.new
    elsif request.post?
      @form = Onboard::ProjectForm.from_params(params)
      Onboard::CreateProject.call(@form) do
        on(:ok) do
          flash[:notice] = 'Successfully created application'
          redirect_back_or_to organization_root_path(presenter.organization_slug)
        end
        on(:invalid) { render :project }
      end
    end
  end

  private

  def set_onboarding
    @onboarding = true
  end

end
