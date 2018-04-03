module Users

  class CreateAccount < Rectify::Command

    def initialize(form)
      @form = form
    end

    def call
      return broadcast(:invalid) if form.invalid?

      transaction do
        create_user
        login_user
        notify_admins
        audit_event
        send_user_details_to_crm
      end

      broadcast(:ok, @user)
    end

    private

    attr_reader :form

    def create_user
      @user = User.create!({
        name: @form.name,
        email: @form.email,
        password: @form.password,
        password_confirmation: @form.password_confirmation,
        terms: @form.terms
      })
    end

    def login_user
      @user = login(@form.email, @form.password)
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
