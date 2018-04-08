class Dashboard::ProjectsController < Dashboard::BaseController
  def index; end

  def new; end

  def show
    Current.organization = current_user.organizations.find_by(name: 'default')
    @project = Project.find(params[:id])
  end
end
