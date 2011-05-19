# -*- coding: utf-8 -*-
module Santas::Little::Helpers
  module String
    module ToUrl

      FORBIDDEN = [
        "@",
        ",", ";",
        ".", ":",
        "ä", "Ä",
        "ü", "Ü",
        "ö", "Ö",
        "ß",
        "€",
        "`", "´",
        "!",
        '"', "'",
        "§",
        "$",
        "%",
        "&",
        "(",
        ")",
        "=",
        "\\",
        "{", "}",
        "[", "]",
        "`", "´",
        "<", ">",
        "|",
        "°",
        "^",

        # Doesn't look so nice and there's a difference
        # to '-' ..for Google at least.
        "_",

        # C-C-Combos!
        '//',
        ',,',
        '--'
      ]

      def to_url
        rules = [
        [ /@/, ' bei '],

        [ /%/, ' prozent ' ],

        # HTML entities and german umlauts
        [ /&auml;|ä|Ä/,  'ae' ],
        [ /&uuml;|ü|Ü/,  'ue' ],
        [ /&ouml;|ö|Ö/,  'oe' ],
        [ /&szlig;|ß/,   'ss' ],

        # Euro
        [ /&euro;|€/, ' euro ' ],

        # Replace HTML entity for ampersand with +
        [ /&amp;/, '+' ],

        # Replace any other HTML entity with whitespace
        [ /&.+?;/, ' ' ],

        # Replace any & left with + too
        [ /&/, '+' ],

        # Remove high commata
        [ /\'|\`|\'/, '' ],

        # Replace everything else with whitespace
        [ /[^a-z0-9\-\+]/, ' ' ],

        # Compact and replace whitespace
        [ /\s+/, '-' ],

        # Compact adjacent -
        [ /[-]+/, '-' ],

        # Replace pattern '-+-' with '-und-'
        [ "-+-", "-und-" ],

        # Trim
        [ /\A[-]+|[-]+\Z/, '' ]
        ]

        to_ascii(:keep_unknown => true).downcase.tap do |result|
          rules.each do |pattern, replacement|
            result.replace(result.gsub(pattern, replacement))
            raise ArgumentError, "Conversion resulted in empty string." if result.blank?
          end
        end
      end

    end
  end
end

String.send :include, Santas::Little::Helpers::String::ToUrl
