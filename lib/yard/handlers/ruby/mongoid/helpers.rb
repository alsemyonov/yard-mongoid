require 'yard/tags/tag'

module YARD
  module Handlers
    module Ruby
      module Mongoid
        module Helpers
          # @param [Symbol] tag
          # @param [String] text
          # @param [String] return_classes
          def get_tag(tag, text, return_classes = [], name=nil)
            YARD::Tags::Tag.new(tag, text, [return_classes].flatten, name)
          end
        end
      end
    end
  end
end
