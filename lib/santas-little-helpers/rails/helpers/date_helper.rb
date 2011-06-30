module Santas::Little::Helpers
  module Rails
    module Helpers
      module DateHelper

        def w3c_date(date)
          date.utc.strftime("%Y-%m-%dT%H:%M:%S+00:00")
        end

      end
    end
  end
end

ActionController::Base.class_eval do
  helper Santas::Little::Helpers::Rails::Helpers::DateHelper
end
