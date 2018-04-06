class Dashboard::ProjectsController < Dashboard::BaseController

  def index; end
  def new; end
  def show
    @project = Project.find(params[:id])
  end

end
