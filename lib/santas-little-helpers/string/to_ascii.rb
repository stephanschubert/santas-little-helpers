# -*- coding: utf-8 -*-
module Santas::Little::Helpers
  module String
    module ToAscii

      # Converts a string into it's ASCII counterpart.
      # Set :keep_unknown to true option if you want to keep unknown chars
      # which can not get translated. (default is false)
      #
      def to_ascii(options = {})

        # Split in muti-byte aware fashion and translate characters over 127
        # and dropping characters not in the translation hash in case
        # :keep_unknown is false.

        mb_chars.split("").map do |c|
          replacement = c.ord <= 127 ? c : translation_hash[c.to_str]
          replacement = c if replacement.nil? and options[:keep_unknown]
          replacement
        end.join
      end

      protected # --------------------------------------------------------------

      def translation_hash
        @@translation_hash ||= setup_translation_hash
      end

      def setup_translation_hash
        # Simple translations
        accented_chars =
          "ÀÁÂÃÅÇÈÉÊËÌÍÎÏÐÑÒÓÔÕ×ØÙÚÛÝàáâãåçèéêëìíîïñòóôõøùúûý".mb_chars.split("")
        unaccented_chars =
          "AAAAACEEEEIIIIDNOOOOxOUUUYaaaaaceeeeiiiinooooouuuy".split("")

        {}.tap do |result|
          accented_chars.each_with_index do |char, index|
            result[char.to_str] = unaccented_chars[index]
          end

          # 2-for-1 translations
          result.update \
          "Æ" => "AE", "æ" => "ae",
          "Ä" => "AE", "ä" => "ae",
          "Ö" => "OE", "ö" => "oe",
          "Ü" => "UE", "ü" => "ue",
          "ß" => "ss"
        end
      end

    end
  end
end

String.send :include, Santas::Little::Helpers::String::ToAscii
