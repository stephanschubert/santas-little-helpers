module Santas::Little::Helpers
  module Rails
    module Helpers
      module MediaBlock

        # Merges a new CSS class into a string of existing CSS classes.
        # Examples
        #   merge_css("group green", "triangle") # => "group green triangle"
        #   merge_css("group green", "group") # => "group green"
        #
        def merge_css(klasses, klass)
          klasses = (klasses || "").split(" ")
          klasses << klass
          klasses.uniq.join(" ")
        end

        def media_block(options = {})
          image = options.pluck(:image) || {}

          options.merge! \
          :class => merge_css(options[:class], "media")

          content_tag :div, options do
            html = ""

            unless image.blank?
              html << content_tag(:div, :class => "img") do
                image_tag image.url, :alt => image.alt
              end
            end

            html << content_tag(:div, :class => "bd") do
              yield
            end

            html.html_safe
          end
        end

      end
    end
  end
end

ActionController::Base.class_eval do
  helper Santas::Little::Helpers::Rails::Helpers::MediaBlock
end
