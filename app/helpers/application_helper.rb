module ApplicationHelper
  def organization_home
    # organization_root_path(Current.organization.slug)
    root_path
  end
end
