require 'yard/handlers/ruby/mongoid/relations/singular_handler'

module YARD::Handlers::Ruby::Mongoid::Relations
  class HasOneHandler < SingularHandler
    handles method_call(:has_one)

    def group_name
      'Has one'
    end

    private
    def return_description
      ''
    end
  end
end
