module YARD
  module Mongoid
    module Helpers
      def register_new_method_object(namespace, name, scope = :instance, &block)
        register self.class.const_get(:MethodObject).new(namespace, name, scope, &block)
      end

      # Creates and registers a new +name+ method in +namespace+
      # with an instance or class +scope+
      # @param [NamespaceObject] namespace the namespace
      # @param [String, Symbol] name the method name
      # @param [Symbol] scope +:instance+ or +:class+
      def register_field_getter(namespace, name, scope = :instance, type = 'Object', default_value = nil)
        register_new_method_object(namespace, name, scope) do |o|
          o.group = MONGOID_FIELDS
          o.visibility = :public
          o.source = statement.source
          o.signature = "def #{name}"
        end.tap do |o|
          docstring = o.docstring.empty? ? "Field #{name}" : o.docstring
          docstring += "\n@return [#{type}] "
          docstring += "(defaults to: +#{default_value}+) " if default_value
          o.docstring = docstring
        end
      end

      # Creates and registers a new +name+= method in +namespace+
      # with an instance or class +scope+
      # @param [NamespaceObject] namespace the namespace
      # @param [String, Symbol] name the method name
      # @param [Symbol] scope +:instance+ or +:class+
      def register_field_setter(namespace, name, scope = :instance)
        register_new_method_object(namespace, "#{name}=", scope) do |o|
          o.group = MONGOID_FIELDS
          o.visibility = :public
          o.source = statement.source
          o.signature = "def #{name}=(value)"
          o.parameters = [['value', nil]]
          o.docstring = "Sets the attribute #{name}\n@param value the value to set the attribute #{name} to."
        end
      end

      # Creates and registers a new +name+? method in +namespace+
      # with an instance or class +scope+
      # @param [NamespaceObject] namespace the namespace
      # @param [String, Symbol] name the method name
      # @param [Symbol] scope +:instance+ or +:class+
      def register_field_presence(namespace, name, scope = :instance)
        register_new_method_object(namespace, "#{name}?", scope) do |o|
          o.group = MONGOID_FIELDS
          o.visibility = :public
          o.source = statement.source
          o.signature = "def #{name}?"
        end
      end

      # Creates and registers a new +name+_change method in +namespace+
      # with an instance or class +scope+
      # @param [NamespaceObject] namespace the namespace
      # @param [String, Symbol] name the method name
      # @param [Symbol] scope +:instance+ or +:class+
      def register_field_change(namespace, name, scope = :instance)
        register_new_method_object(namespace, "#{name}_change", scope) do |o|
          o.group = MONGOID_FIELDS
          o.visibility = :public
          o.source = statement.source
          o.signature = "def #{name}_change"
        end
      end

      # Creates and registers a new +name+_changed? method in +namespace+
      # with an instance or class +scope+
      # @param [NamespaceObject] namespace the namespace
      # @param [String, Symbol] name the method name
      # @param [Symbol] scope +:instance+ or +:class+
      def register_field_changed(namespace, name, scope = :instance)
        register_new_method_object(namespace, "#{name}_changed?", scope) do |o|
          o.group = MONGOID_FIELDS
          o.visibility = :public
          o.source = statement.source
          o.signature = "def #{name}_changed?"
        end
      end

      # Creates and registers a new +name+_was method in +namespace+
      # with an instance or class +scope+
      # @param [NamespaceObject] namespace the namespace
      # @param [String, Symbol] name the method name
      # @param [Symbol] scope +:instance+ or +:class+
      def register_field_was(namespace, name, scope = :instance)
        register_new_method_object(namespace, "#{name}_was", scope) do |o|
          o.group = MONGOID_FIELDS
          o.visibility = :public
          o.source = statement.source
          o.signature = "def #{name}_was"
        end
      end

      # Creates and registers a new reset_+name+! method in +namespace+
      # with an instance or class +scope+
      # @param [NamespaceObject] namespace the namespace
      # @param [String, Symbol] name the method name
      # @param [Symbol] scope +:instance+ or +:class+
      def register_field_reset(namespace, name, scope = :instance)
        register_new_method_object(namespace, "reset_#{name}!", scope) do |o|
          o.group = MONGOID_FIELDS
          o.visibility = :public
          o.source = statement.source
          o.signature = "def reset_#{name}!"
        end
      end
    end
  end
end
