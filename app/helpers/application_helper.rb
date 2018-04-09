module ApplicationHelper
  def organization_home
    organization_root_path(Current.organization.slug)
  end
end
