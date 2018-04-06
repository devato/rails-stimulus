module Users

  class Login < Rectify::Command

    def initialize(form)
      @form = form
    end

    def call
      return broadcast(:invalid) if form.invalid?
      return broadcast(:not_found) unless login_user

      transaction do
        notify_admins
        audit_event
        send_user_details_to_crm
      end

      broadcast(:ok, @user)
    end

    private

    attr_reader :form

    def login_user
      @user = login(@form.email, @form.password)
      Current.user = @user
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
