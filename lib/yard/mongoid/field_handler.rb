module YARD
  module Mongoid
    class FieldHandler < YARD::Handlers::Ruby::Base
      include Extensions

      handles method_call(:field)

      def process
        nobj = effected_namespace
        mscope = scope
        name = statement.parameters[0].last

        if name.type == :symbol
          name = name.source[1..-1]

          register MethodObject.new(nobj, name, mscope) do |o|
            o.visibility = :public
            o.source = statement.source
            o.signature = "def #{name}"
          end

          register MethodObject.new(nobj, "#{name}=", mscope) do |o|
            o.visibility = :public
            o.source = statement.source
            o.signature = "def #{name}=(value)"
            o.parameters = [['value', nil]]
          end

          register MethodObject.new(nobj, "#{name}?", mscope) do |o|
            o.visibility = :public
            o.source = statement.source
            o.signature = "def #{name}?"
          end

          register MethodObject.new(nobj, "#{name}?", mscope) do |o|
            o.visibility = :public
            o.source = statement.source
            o.signature = "def #{name}?"
          end
        end
      end
    end
  end
end
