require 'yard/mongoid/extensions'
require 'yard/mongoid/helpers'

module YARD
  module Mongoid
    class FieldHandler < YARD::Handlers::Ruby::AttributeHandler
      include Extensions
      include Helpers

      handles method_call(:field)

      def process
        name       = statement.parameters[0].last

        if name.type == :symbol
          name = name.source[1..-1]

          register_field_getter(effected_namespace, name, scope, class_name, default_value)
          register_field_setter(effected_namespace, name, scope)
          register_field_presence(effected_namespace, name, scope)
          register_field_change(effected_namespace, name, scope)
          register_field_changed(effected_namespace, name, scope)
          register_field_was(effected_namespace, name, scope)
          register_field_reset(effected_namespace, name, scope)
          super
        end
      end

      protected

      def class_name
        return @class_name if instance_variable_defined?(:@class_name)

        if statement.parameters.size > 2
          statement.parameters[1].source.split(/,\s*/).each do |key_and_value|
            if key_and_value =~ hash_args[:type]
              @class_name = $2
              break
            end
          end
        end
        @class_name ||= 'String'
      end

      def default_value
        return @default_value if instance_variable_defined?(:@default_value)

        if statement.parameters.size > 2
          statement.parameters[1].source.split(/,\s*/).each do |key_and_value|
            if key_and_value =~ /(:default\s*=>|default:)\s*(.+)\s*$/
              @default_value = $2
              break
            end
          end
        end
        @default_value ||= nil
      end

      protected

      def hash_args
        @hash_args ||= Hash.new { |hash, key| hash[key] = /(:#{key.to_s}\s*=>|#{key.to_s}:)\s*([A-Z][A-Za-z0-9]*)/ }
      end
    end
  end
end
