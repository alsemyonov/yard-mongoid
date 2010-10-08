module YARD
  module Mongoid
    module Legacy
      class FieldHandler < YARD::Handlers::Ruby::Legacy::Base
        include Helpers

        handles /\Afield\s+:/

        def process
          nobj = namespace
          mscope = scope
          name = statement.tokens[2,1].to_s[1..-1]

          register_field_getter(nobj, name, mscope)
          register_field_setter(nobj, name, mscope)
          register_field_presence(nobj, name, mscope)
          register_field_change(nobj, name, mscope)
          register_field_changed(nobj, name, mscope)
          register_field_was(nobj, name, mscope)
          register_field_reset(nobj, name, mscope)
        end
      end
    end
  end
end
