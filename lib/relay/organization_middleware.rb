module Relay

  class OrganizationMiddleware

    def initialize(app)
      @app = app
    end

    def call(env)
      _, organization_id, request_path = env['REQUEST_PATH'].split('/', 3)
      if organization_id.present?
        Current.organization = Organization.friendly.find(organization_id)
        env["SCRIPT_NAME"]  = "/#{organization_id}"
        env["PATH_INFO"]    = "/#{request_path}"
        env["REQUEST_PATH"] = "/#{request_path}"
        env["REQUEST_URI"]  = "/#{request_path}"

      end

      Rails.logger.info "====== Current.user: #{Current.user}"
      Rails.logger.info "====== Current.org: #{Current.organization}"

      status, headers, body = @app.call(env)
      [status, headers, body]
    end

  end

end
