require 'yard/mongoid/helpers'

module YARD
  module Mongoid
    module Legacy
      class FieldHandler < YARD::Handlers::Ruby::Legacy::AttributeHandler
        include YARD::Mongoid::Helpers

        handles /\Afield\s+:/

        def process
          name = statement.tokens[2,1].to_s[1..-1]

          register_field_getter(namespace, name, scope)
          #register_field_setter(namespace, name, scope)
          #register_field_presence(namespace, name, scope)
          #register_field_change(namespace, name, scope)
          #register_field_changed(namespace, name, scope)
          #register_field_was(namespace, name, scope)
          #register_field_reset(namespace, name, scope)
          #super
        end
      end
    end
  end
end
