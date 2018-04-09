class Dashboard::ProjectsController < Dashboard::BaseController

  before_action :set_project, only: [:edit, :update]
  before_action :set_current_supported_languages, only: [:new, :edit, :create, :update]
  before_action :set_presenter, only: [:new, :edit, :create, :update]

  skip_before_action :require_project

  def new
    redirect_to :new_organization if Current.user.organizations.empty?
    @project_form = Onboard::ProjectForm.new
    @onboarding = true
  end

  def create
    @project_form = Onboard::ProjectForm.from_params(params)
    Onboard::CreateProject.call(@project_form) do
      on(:ok) do
        flash[:notice] = 'Successfully created project'
        redirect_back_or_to organization_home
      end
      on(:invalid) { render :new }
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def set_presenter
    present Onboard::ProjectPresenter.new(user: Current.user)
  end

  def set_supported_languages
    @supported_languages = SupportedLanguage.active
  end

end
