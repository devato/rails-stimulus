class Onboard::ApplicationPresenter < Rectify::Presenter
  attribute :user, User

  def organization
    user.organizations.first.name.titleize
  end

  def organization_id
    user.organizations.first.id
  end

end
