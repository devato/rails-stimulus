class Dashboard::OrganizationsController < Dashboard::BaseController
  def index; end

  def new
    @onboarding = true
    @org_form = Onboard::OrganizationForm.new
  end

  def create
    @org_form = Onboard::OrganizationForm.from_params(params)
    Onboard::CreateOrganization.call(@org_form) do
      on(:ok) do
        flash[:notice] = 'Successfully created organization'
        redirect_back_or_to organization_home
      end
      on(:invalid) { render :new }
    end
  end
end
