require 'yard/handlers/ruby/mongoid/relations/base'

module YARD::Handlers::Ruby::Mongoid::Relations
  class SingularHandler < Base
    def class_name
      super(false)
    end

    private

    def return_description
      "An associated {#{method_name.humanize}}"
    end
  end
end
