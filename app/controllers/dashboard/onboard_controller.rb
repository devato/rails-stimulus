class Dashboard::OnboardController < Dashboard::BaseController

  skip_before_action :redirect_to_onboard
  before_action :set_onboarding

  def organization

  end

  private

  def set_onboarding
    @onboarding = true
  end

end
