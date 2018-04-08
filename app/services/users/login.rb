module Users
  class Login < Rectify::Command
    def initialize(form)
      @form = form
    end

    def call
      return broadcast(:invalid) if form.invalid?
      return broadcast(:not_found) unless login_user

      transaction do
        set_current_objects
      end

      broadcast(:ok, @user)
    end

    private

    attr_reader :form, :user

    def login_user
      @user = login(@form.email, @form.password)
    end

    def set_current_objects
      Relay::SetCurrentObjects.call(user)
    end

  end
end
