module Users
  class CreateAccount < Rectify::Command
    def initialize(form)
      @form = form
    end

    def call
      return broadcast(:invalid) if form.invalid?

      transaction do
        create_user
        create_organization
        connect_user_and_organization
        login_user
        set_current_objects
        notify_admins
        audit_event
        send_user_details_to_crm
      end

      broadcast(:ok, @user)
    end

    private

    attr_reader :form, :user

    def create_user
      first_name, last_name = @form.name.split(' ', 2)
      @user = User.create!(
        first_name: first_name,
        last_name: last_name,
        email: @form.email,
        password: @form.password,
        password_confirmation: @form.password_confirmation,
        terms: @form.terms
      )
    end

    def create_organization
      @organization = Organization.create(
        name: form.organization_name,
        default: true,
        active: true
      )
    end

    def connect_user_and_organization
      @user.organizations << @organization
    end

    def login_user
      # https://github.com/Sorcery/sorcery#core
      @user = auto_login(user)
    end

    def set_current_objects
      Relay::SetCurrentObjects.call(user)
    end

    def notify_admins
      # ...
    end

    def audit_event
      # ...
    end

    def send_user_details_to_crm
      # ...
    end
  end
end
