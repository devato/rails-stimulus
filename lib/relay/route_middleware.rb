module Relay
  class RouteMiddleware
    def initialize(app)
      @app = app
    end

    def call(env)
      _, organization_id, request_path = env['REQUEST_PATH'].split('/', 3)

      Rails.logger.info "============ org: #{organization_id}"
      if organization_id.present?
        if Current.organization = Organization.find_by(slug: organization_id)
          env['SCRIPT_NAME']  = "/#{organization_id}"
          env['PATH_INFO']    = "/#{request_path}"
          env['REQUEST_PATH'] = "/#{request_path}"
          env['REQUEST_URI']  = "/#{request_path}"
        end
      end

      status, headers, body = @app.call(env)
      [status, headers, body]
    end
  end
end
