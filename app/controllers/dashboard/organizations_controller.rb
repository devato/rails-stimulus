class Dashboard::OrganizationsController < Dashboard::BaseController

  def index; end

  def new
    @onboarding = true
    if request.get?
      # redirect_to :onboard_project unless current_user.organizations.empty?
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

end
