class Dashboard::IndexController < Dashboard::BaseController
  def index
    @projects = ProjectDecorator.decorate_collection(Current.user.projects)
  end
end
