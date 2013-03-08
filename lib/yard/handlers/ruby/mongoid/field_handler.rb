require 'yard'
require 'yard/handlers/ruby/mongoid/extensions'
require 'yard/handlers/ruby/mongoid/helpers'

module YARD::Handlers::Ruby
  module Mongoid
    class FieldHandler < YARD::Handlers::Ruby::AttributeHandler
      include Extensions
      include YARD::Handlers::Ruby::Mongoid::Helpers

      MONGOID_FIELDS = 'Fields'

      namespace_only

      handles method_call(:field)

      def process
        name = statement.parameters[0].last

        if name.type == :symbol
          name = name.source[1..-1]

          add_field_getter(effected_namespace, name, class_name, default_value)
          add_field_setter(effected_namespace, name, class_name)
          #register_field_presence(effected_namespace, name, scope)
          #register_field_change(effected_namespace, name, scope)
          #register_field_changed(effected_namespace, name, scope)
          #register_field_was(effected_namespace, name, scope)
          #register_field_reset(effected_namespace, name, scope)
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
          @class_name = 'true, false' if @class_name == 'Boolean'
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
        @hash_args ||= Hash.new do |hash, key|
          hash[key] = /(:#{key.to_s}\s*=>|#{key.to_s}:\s)\s*([A-Z][A-Za-z0-9]*)/
        end
      end

      # @yieldparam [YARD::CodeObjects::MethodObject]
      def add_field_method(namespace, name, &block)
        register YARD::CodeObjects::MethodObject.new(namespace, name, :instance) do |mo|
          mo.group = MONGOID_FIELDS
          mo.visibility ||= :public
          mo.source = statement.source
          mo.dynamic = true
          mo.signature = "def #{name}"
          mo.docstring = '' if mo.docstring.empty?
          block.call(mo) if block_given?
        end
      end

      # Creates and registers a new +name+ method in +namespace+
      # with an instance or class +scope+
      # @param [NamespaceObject] namespace the namespace
      # @param [String, Symbol] name the method name
      def add_field_getter(namespace, name, type = 'Object', default_value = nil)
        add_field_method(namespace, name) do |o|
          default_value = "(defaults to: +#{default_value}+) " if default_value
          o.docstring.add_tag get_tag(:return, default_value, type)
        end
      end

      # Creates and registers a new +name+= method in +namespace+
      # with an instance or class +scope+
      # @param [NamespaceObject] namespace the namespace
      # @param [String, Symbol] name the method name
      def add_field_setter(namespace, name, type = 'Object')
        add_field_method(namespace, "#{name}=") do |o|
          o.parameters = [[name, nil]]
          o.docstring.add_tag get_tag(:return, nil, type)
          o.docstring.add_tag get_tag(:param, "new #{name}", type, name)
        end
      end

      # Creates and registers a new +name+? method in +namespace+
      # with an instance or class +scope+
      # @param [NamespaceObject] namespace the namespace
      # @param [String, Symbol] name the method name
      def add_field_presence(namespace, name)
        add_field_method(namespace, "#{name}?")
      end

      # Creates and registers a new +name+_change method in +namespace+
      # with an instance or class +scope+
      # @param [NamespaceObject] namespace the namespace
      # @param [String, Symbol] name the method name
      def add_field_change(namespace, name)
        add_field_method(namespace, "#{name}_change")
      end

      # Creates and registers a new +name+_changed? method in +namespace+
      # with an instance or class +scope+
      # @param [NamespaceObject] namespace the namespace
      # @param [String, Symbol] name the method name
      def add_field_changed(namespace, name)
        add_field_method(namespace, "#{name}_changed?")
      end

      # Creates and registers a new +name+_was method in +namespace+
      # with an instance or class +scope+
      # @param [NamespaceObject] namespace the namespace
      # @param [String, Symbol] name the method name
      def register_field_was(namespace, name)
        add_field_method(namespace, "#{name}_was")
      end

      # Creates and registers a new reset_+name+! method in +namespace+
      # with an instance or class +scope+
      # @param [NamespaceObject] namespace the namespace
      # @param [String, Symbol] name the method name
      def register_field_reset(namespace, name)
        add_field_method(namespace, "reset_#{name}!")
      end
    end
  end
end
