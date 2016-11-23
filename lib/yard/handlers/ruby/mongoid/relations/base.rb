require 'yard'
require 'active_support/inflector'
require 'yard/handlers/ruby/mongoid/helpers'

module YARD::Handlers::Ruby::Mongoid
  module Relations
    class Base < YARD::Handlers::Ruby::MethodHandler
      include YARD::Handlers::Ruby::Mongoid::Helpers
      namespace_only

      def process
        namespace.groups << group_name unless namespace.groups.include? group_name

        object           = YARD::CodeObjects::MethodObject.new(namespace, method_name)
        object.group     = group_name
        object.docstring = return_description
        object.docstring.add_tag get_tag(:return, '', class_name)
        object.docstring.add_tag get_tag(:see, "http://mongoid.org/en/mongoid/docs/relations.html##{statement.method_name(true)}")
        object.dynamic = true
        register object
      end

      def group_name
        'Mongoid Relations'
      end

      private

      def method_name
        call_params[0]
      end

      def class_name(singularize = false)
        param_size = statement.parameters.size
        if param_size > 2
          i = 1
          while i < param_size - 1
            # May want to evaluate doing it this way
            statement.parameters[i].jump(:hash).source =~ /(:class_name\s*=>|class_name:)\s*["']([^"']+)["']/
            return Regexp.last_match(2) if Regexp.last_match(2)
            i += 1
          end
        end

        if singularize
          method_name.camelize.singularize
        else
          method_name.camelize
        end
      end

      def return_description
        "An array of associated #{method_name}."
      end
    end
  end
end
