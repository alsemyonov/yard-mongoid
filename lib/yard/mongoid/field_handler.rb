require 'yard/mongoid/extensions'
require 'yard/mongoid/helpers'

module YARD
  module Mongoid
    class FieldHandler < YARD::Handlers::Ruby::AttributeHandler
      include Extensions
      include Helpers

      handles method_call(:field)

      def process
        nobj       = effected_namespace
        mscope     = scope
        name       = statement.parameters[0].last

        if name.type == :symbol
          name = name.source[1..-1]

          register_field_getter(nobj, name, mscope, class_name, defvalue)
          #register_field_setter(nobj, name, mscope)
          #register_field_presence(nobj, name, mscope)
          #register_field_change(nobj, name, mscope)
          #register_field_changed(nobj, name, mscope)
          #register_field_was(nobj, name, mscope)
          #register_field_reset(nobj, name, mscope)
          #super
        end
      end

      protected

      def class_name
        return @class_name if instance_variable_defined?(:@class_name)

        if statement.parameters.size > 2
          statement.parameters[1].source.split(/,\s*/).each do |keyvalue|
            if keyvalue =~ hash_args[:type]
              @class_name = $2
              break
            end
          end
        end
        @class_name ||= 'String'
      end

      def defvalue
        return @defvalue if instance_variable_defined?(:@defvalue)

        if statement.parameters.size > 2
          statement.parameters[1].source.split(/,\s*/).each do |keyvalue|
            if keyvalue =~ /(:default\s*=>|default:)\s*(.+)\s*$/
              @defvalue = $2
              break
            end
          end
        end
        @defvalue ||= nil
      end

      protected

      def hash_args
        @hash_args ||= Hash.new { |hash, key| hash[key] = /(:#{key.to_s}\s*=>|#{key.to_s}:)\s*([A-Z][A-Za-z0-9]*)/ }
      end
    end
  end
end
