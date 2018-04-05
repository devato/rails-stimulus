class Onboard::ProjectPresenter < Rectify::Presenter
  attribute :user, User

  def organization
    user.organizations.first.name.titleize
  end

  def organization_id
    user.organizations.first.id
  end

  def organization_slug
    user.organizations.first.slug
  end

end
