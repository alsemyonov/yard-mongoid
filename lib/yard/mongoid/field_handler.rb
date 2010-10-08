module YARD
  module Mongoid
    class FieldHandler < YARD::Handlers::Ruby::Base
      include Extensions
      include Helpers

      handles method_call(:field)

      def process
        nobj = effected_namespace
        mscope = scope
        name = statement.parameters[0].last

        if name.type == :symbol
          name = name.source[1..-1]

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
