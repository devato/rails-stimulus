module Relay
  # NOTES: Processing requests
  # 1. Middleware sets the org if it is found
  #    using the first section of the url
  # 2. This happens before the routes are hit
  #    so adding constraints to the routes
  #    depending on org present? or nil?
  #    will determine the correct root path
  #    to use.
  # 3. By the time the controllers/services
  #    run, the Current org is set and
  #    it will use it, or find the default
  #    org. See services/relay/set_current_objects.rb
  class RouteMiddleware
    def initialize(app)
      @app = app
    end

    def call(env)
      build_request_data(env)
      if @organization_id.present?
        if (Current.organization = Organization.find_by(slug: @organization_id))
          env['SCRIPT_NAME']  = "/#{@organization_id}"
          env['PATH_INFO']    = "/#{@request_path}"
          env['REQUEST_PATH'] = "/#{@request_path}"
          env['REQUEST_URI']  = "/#{@request_path}"
        end
      end

      status, headers, body = @app.call(env)
      [status, headers, body]
    end

    private

    # NOTE: capybara sets HTTP_REQUEST_PATH
    #       so added a check for it so no other
    #       customizations needed in specs.
    def build_request_data(env)
      @_ = nil
      @organization_id = nil
      @request_path = nil

      if env['REQUEST_PATH'].present?
        @_, @organization_id, @request_path = env['REQUEST_PATH'].split('/', 3)
      elsif env['HTTP_REQUEST_PATH'].present?
        @_, @organization_id, @request_path = env['HTTP_REQUEST_PATH'].split('/', 3)
      end
    end
  end
end
