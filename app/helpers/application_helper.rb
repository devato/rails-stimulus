module ApplicationHelper
  def organization_home(org = nil)
    org = org.nil? ? Current.organization : org
    organization_root_path(org.slug, script_name: false)
  end
end
