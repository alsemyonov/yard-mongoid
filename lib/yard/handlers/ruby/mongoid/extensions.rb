module YARD::Handlers::Ruby
  module Mongoid
    module Extensions
    protected
      def effected_namespace
        if statement.type == :command_call
          context = statement.jump(:var_ref)

          unless context.source == 'self'
            return ensure_loaded!(
              Registry.resolve(namespace, context.source)
            )
          end
        end

        namespace
      end
    end
  end
end
