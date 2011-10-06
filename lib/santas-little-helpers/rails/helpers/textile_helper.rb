module Santas::Little::Helpers
  module Rails
    module Helpers
      module TextileHelper

        # Textilize the input but don't wrap the result in a <p>aragraph.
        def textilize_without_paragraph(*args)
          textilize(*args).gsub(/^<p>|<\/p>$/, '').html_safe
        end

        # Remove textile formatting
        def untextilize(*args)
          # Let textile do the work and just strip the tags afterwards.
          strip_tags(textilize(*args))
        end

      end
    end
  end
end

ActionController::Base.class_eval do
  helper Santas::Little::Helpers::Rails::Helpers::TextileHelper
end
