module JM
  module ApplicationHelper
    def base_url
      @_base_url ||= "#{request.env['rack.url_scheme']}://#{request.env['HTTP_HOST']}"
    end
  end
end
