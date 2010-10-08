module YARD
  module Mongoid
    module Legacy
      class FieldHandler < YARD::Handlers::Ruby::Legacy::Base
        handles /\Afield\s+:/
        namespace_only

        def process
          nobj = namespace
          mscope = scope
          name = statement.tokens[2,1].to_s[1..-1]

          getter = MethodObject.new(nobj, name, mscope) do |o|
            o.visibility = :public
            o.source = statement.source
            o.signature = "def #{name}"
          end

          setter = MethodObject.new(nobj, "#{name}=", mscope) do |o|
            o.visibility = :public
            o.source = statement.source
            o.signature = "def #{name}=(value)"
            o.parameters = [['value', nil]]
          end

          present = MethodObject.new(nobj, "#{name}?", mscope) do |o|
            o.visibility = :public
            o.source = statement.source
            o.signature = "def #{name}?"
          end

          change_present = MethodObject.new(nobj, "#{name}_changed?", mscope) do |o|
            o.visibility = :public
            o.source = statement.source
            o.signature = "def #{name}_changed?"
          end
          register(getter)
          register(setter)
          register(present)
          register(change_present)
        end
      end
    end
  end
end
